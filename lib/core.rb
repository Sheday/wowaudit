# Dependencies
require 'require_all'
require 'sequel'
require 'redis'
require 'rbattlenet'
require 'typhoeus'
require 'aws-sdk'
require 'date'
require 'mysql2'
require 'yaml'
require 'tzinfo'
require 'csv'
require 'rollbar'

MAX_OCCURRENCES = {
  essentials: 2,
  collections: 1,
  wcl: 1,
  raiderio: 3,
  keystones: 1,
}

def register
  # TODO: Figure out a way to properly fix registration race conditions
  sleep rand(0..15.0)

  occurrences = Audit.fetch_occurrences(TYPE)
  zone = occurrences.select { |_, v| v == occurrences.values.min }.keys.sample
  Audit.register_worker(TYPE, zone) if REGISTER
end

# File Storage
storage_data = YAML::load(File.open('config/storage.yml'))
Aws.config.update(
  endpoint: storage_data["endpoint"],
  access_key_id: storage_data["access_key"],
  secret_access_key: storage_data["secret_access_key"],
  region: storage_data["region"]
)
STORAGE = Aws::S3::Resource.new
BUCKET = storage_data["bucket"]

# Load keys
keys = YAML::load(File.open('config/keys.yml'))
ROLLBAR_KEY = keys["rollbar_key"]
db_config = {}

Rollbar.configure do |config|
  config.access_token = ROLLBAR_KEY

  if `hostname`.strip == "L049.local"
    config.enabled = false
    require 'byebug'
    db_config = YAML::load(File.open('config/external_database.yml'))
  else
    db_config = YAML::load(File.open('config/database.yml'))
  end
end

begin
  # Connections
  DB = Sequel.connect(db_config['mysql'])
  DB2 = Mysql2::Client.new(db_config['mysql'])
  REDIS = Redis.new(url: db_config['redis']['host'], password: db_config['redis']['password'])

  # Modules
  require_rel 'constants'
  require_rel 'models'
  require_rel 'sections'
  require_rel 'utils'

  # Store realm data in memory
  REALMS = Audit::Realm.all.map{ |realm| [realm.id, realm] }.to_h

  schedule = register

  sleep 1
  if REGISTER && Audit.fetch_occurrences(TYPE)[schedule&.zone || 0] > (MAX_OCCURRENCES[TYPE.to_sym] || 99)
    schedule = register
  end

  ZONE = (TYPE.to_s == 'wcl' ? 1 : schedule&.zone || 0)
  unless TYPE.include?("dedicated")
    schedules = Audit::Schedule.all
    KEY = Audit::ApiKey
      .where(zone: ZONE, target: (TYPE == "wcl" ? "wcl" : "bnet"))
      .reject { |key| schedules.map(&:api_key_id).include?(key.id) }.sample

    schedule.update(api_key: KEY)
    Audit.authenticate(KEY.client_id, KEY.client_secret) unless TYPE == "wcl"
  end

rescue Mysql2::Error => e
  # The SQL proxy isn't always instantly available on server reboot
  # Therefore, retry connection after 5 seconds have passed
  Rollbar.error(e)
  puts "Connection to the database failed. Trying again in 5 seconds."
  sleep 5
  retry
end
