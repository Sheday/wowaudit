module Audit
  class CharacterEssentials < CharacterBnet
    def essentials_only?
      true
    end

    def update_snapshots
      nil # Don't update snapshots when only the essential data is there
    end

    def check_data_completeness(response)
      # TODO: Fix HashResult to recognise these as empty when it happens (sporadically)
      # also change the structure to not have double nested data like this
      raise ApiLimitReachedException if response.dig(:equipment, :status_code) == 429
      response[:equipment] && response[:equipment][:equipped_items]
    end
  end
end
