CURRENT_KEYSTONE_SEASON = 9
FIRST_PERIOD_OF_SEASON = 885

MYTHIC_DUNGEONS = {
  16076 => "Brackenhide Hollow",
  16079 => "Halls of Infusion",
  16082 => "Neltharus",
  16085 => "Ruby Life Pools",
  16088 => "Algeth'ar Academy",
  16091 => "The Azure Vault",
  16094 => "The Nokhud Offensive",
  16097 => "Uldaman: Legacy of Tyr",
}

KEYSTONE_DUNGEONS = {
}

SLUGIFIED_DUNGEON_NAMES = KEYSTONE_DUNGEONS.transform_values do |dungeon_name|
  dungeon_name.gsub("'", "").gsub(":", "").gsub(" -", "").gsub(" ", "_").downcase
end

WEEKLY_EVENT_QUESTS = [
  62631,
  62635,
  62636,
  62637,
  62638,
  62639,
  62640,
]

RAID_DIFFICULTIES = {
  1 => 'raid_finder',
  3 => 'normal',
  4 => 'heroic',
  5 => 'mythic'
}

GREAT_VAULT_RAID_KILLS_NEEDED = {
  1 => 2,
  2 => 5,
  3 => 8,
}

GREAT_VAULT_TO_ILVL = {
  'raid' => {
    'mythic' => 421,
    'heroic' => 408,
    'normal' => 395,
    'raid_finder' => 382,
  },
  'dungeon' => {
    20 => 421,
    19 => 418,
    18 => 418,
    17 => 415,
    16 => 415,
    15 => 411,
    14 => 408,
    13 => 408,
    12 => 405,
    11 => 402,
    10 => 398,
    9 => 395,
    8 => 395,
    7 => 392,
    6 => 389,
    5 => 389,
    4 => 385,
    3 => 385,
    2 => 382,
    0 => '',
  },
  'pvp' => {
    2400 => 418,
    2100 => 415,
    1950 => 411,
    1800 => 408,
    1600 => 405,
    1400 => 402,
    1200 => 398,
    1000 => 395,
    0 => 392,
  }
}

CUTTING_EDGE_ACHIEVEMENTS = [
  7485, # Will of the Emperor
  7486, # Grand Empress Shek'zeer
  7487, # Sha of Fear
  8238, # Lei Shen
  8260, # Ra-den
  8400, # Garrosh Hellscream (10 player)
  8401, # Garrosh Hellscream (25 player)
  9442, # Imperator Mar'gok
  9443, # Blackhand's Crucible
  10045, # Archimonde
  11191, # Xavius
  11580, # Helya
  11192, # Gul'dan
  11875, # Kil'jaeden
  12111, # Argus the Unmaker
  12535, # G'huun
  13323, # Lady Jaina Proudmoore
  13419, # Uu'nat, Harbinger of the Void
  13785, # Queen Azshara
  14069, # N'zoth the Corruptor
  14461, # Sire Denathrius
  15135, # Sylvanas Windrunner
  15471, # The Jailer
  17108, # Raszageth the Storm-Eater
]

AHEAD_OF_THE_CURVE_ACHIEVEMENTS = [
  6954, # Will of the Emperor
  8246, # Grand Empress Shek'zeer
  8248, # Sha of Fear
  8249, # Lei Shen
  8260, # Ra-den (count if Cutting Edge is obtained)
  8398, # Garrosh Hellscream (10 player)
  8399, # Garrosh Hellscream (25 player)
  9441, # Imperator Mar'gok
  9444, # Blackhand's Crucible
  10044, # Archimonde
  11194, # Xavius
  11581, # Helya
  11195, # Gul'dan
  11874, # Kil'jaeden
  12110, # Argus the Unmaker
  12536, # G'huun
  13322, # Lady Jaina Proudmoore
  13418, # Uu'nat, Harbinger of the Void
  13784, # Queen Azshara
  14068, # N'zoth the Corruptor
  14460, # Sire Denathrius
  15134, # Sylvanas Windrunner
  15470, # The Jailer
  17107, # Raszageth the Storm-Eater
]

VALID_RAIDS = [
  {"name"=>"Vault of the Incarnates", "days"=>[0, 1, 2, 3, 4, 5, 6], "id"=>30, "encounters"=>[{"id"=>nil, "name"=>"Eranog", "raid_ids"=>{"raid_finder"=>[16359], "normal"=>[16371], "heroic"=>[16379], "mythic"=>[16387]}}, {"id"=>nil, "name"=>"Terros", "raid_ids"=>{"raid_finder"=>[16361], "normal"=>[16372], "heroic"=>[16380], "mythic"=>[16388]}}, {"id"=>nil, "name"=>"The Primal Council", "raid_ids"=>{"raid_finder"=>[16362], "normal"=>[16373], "heroic"=>[16381], "mythic"=>[16389]}}, {"id"=>nil, "name"=>"Sennarth, the Cold Breath", "raid_ids"=>{"raid_finder"=>[16366], "normal"=>[16374], "heroic"=>[16382], "mythic"=>[16390]}}, {"id"=>nil, "name"=>"Dathea, Ascended", "raid_ids"=>{"raid_finder"=>[16367], "normal"=>[16375], "heroic"=>[16383], "mythic"=>[16391]}}, {"id"=>nil, "name"=>"Kurog Grimtotem", "raid_ids"=>{"raid_finder"=>[16368], "normal"=>[16376], "heroic"=>[16384], "mythic"=>[16392]}}, {"id"=>nil, "name"=>"Broodkeeper Diurna", "raid_ids"=>{"raid_finder"=>[16369], "normal"=>[16377], "heroic"=>[16385], "mythic"=>[16393]}}, {"id"=>nil, "name"=>"Raszageth the Storm-Eater", "raid_ids"=>{"raid_finder"=>[16370], "normal"=>[16378], "heroic"=>[16386], "mythic"=>[16394]}}]}
]

WCL_IDS = VALID_RAIDS.map{ |raid| raid["encounters"].map{ |encounter| encounter["id"].to_s } }.flatten
