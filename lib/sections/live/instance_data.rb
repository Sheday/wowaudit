module Audit
  module Live
    class InstanceData < Data
      def add
        encounters_by_raid = VALID_RAIDS[:live].map{ |raid|
          raid['encounters'].map{ |boss|
            boss['raid_ids']
          }
        }
        boss_ids = encounters_by_raid.flatten.map{ |encounter| encounter.values }.flatten
        raid_list = {}
        great_vault_list = {}
        raid_output = {'raids_raid_finder' => [], 'raids_raid_finder_weekly' => [],
                      'raids_normal' => [],      'raids_normal_weekly' => [],
                      'raids_heroic' => [],      'raids_heroic_weekly' => [],
                      'raids_mythic' => [],      'raids_mythic_weekly' => []}
        dungeon_list = {}
        weekly_regular_dungeons_done = 0

        begin
          dungeons_and_raids =  @data[:achievement_statistics][:categories].find do |category|
            category[:name] == "Dungeons & Raids"
          end

          dungeons_and_raids[:sub_categories].map{ |cat| cat[:statistics] }.flatten.lazy.each do |instance|
            if MYTHIC_DUNGEONS.include?(instance[:id])
              completed = (instance[:last_updated_timestamp] / 1000) > Audit.timestamp
              weekly_regular_dungeons_done += (completed ? 1 : 0)
              @character.data["weekly_#{MYTHIC_DUNGEONS[instance[:id]]}"] = (completed ? 'yes' : 'no')
            end

            # Track weekly Raid kills through the statistics
            if boss_ids.include?(instance[:id])
              raid_list[instance[:id]] = [
                instance[:quantity].to_i,
                (instance[:last_updated_timestamp] / 1000) > Audit.timestamp ? 1 : 0,
              ]
            end
          end
        rescue
          nil
        end

        (@data.dig(:season_keystones, :best_runs) || []).lazy.each do |run|
          run_id = run[:completed_timestamp] / 1000
          run_period = Audit.period_from_timestamp(run_id).to_s

          # Apparently the timestamp in Blizzard's API can change sometimes to be 1 second earlier or later.
          # Don't count occurrences within the same 120 seconds as multiple dungeons.
          already_stored = (@character.details['keystones'][run_period] || {}).keys.map(&:to_i).any? do |other_timestamp|
            other_timestamp - 60 < run_id && other_timestamp + 60 > run_id
          end

          unless already_stored
            (@character.details['keystones'][run_period] ||= {})[run_id.to_s] = {
              "level" => run[:keystone_level],
              "dungeon" => run.dig(:dungeon, :id),
            }
          end
        end

        best_runs = @data.dig(:season_keystones, :best_runs)
                      &.group_by { |run| run.dig(:dungeon, :id) }
                      &.transform_values { |runs| runs.map { |run| run.dig(:mythic_rating, :rating) }.max } || {}

        SLUGIFIED_DUNGEON_NAMES.lazy.each do |dungeon_id, dungeon_name|
          @character.data["#{dungeon_name}_score"] = best_runs[dungeon_id.to_i].to_i
          @character.data["#{dungeon_name}_total"] = (@character.details['keystones'].values.reduce(:merge) || {}).sum do |run_id, run|
            run['dungeon'].to_i == dungeon_id.to_i ? 1 : 0
          end
        end

        @character.data['weekly_regular_dungeons_done'] = weekly_regular_dungeons_done

        @character.data['m+_score'] = (@data.dig(:season_keystones, :mythic_rating, :rating) || 0).to_i

        vault_index = -1
        encounters_by_raid.each_with_index do |raid_encounters, raid_index|
          # Fated season
          for_vault = VALID_RAIDS[:live][raid_index]["periods"].include?(Audit.period) || Audit.period >= 962
          # Normal season
          # for_vault = raid_index + 1 == encounters_by_raid.length

          raid_encounters.each_with_index do |encounter, index|
            if (boss_ids & encounter['normal']).any? && for_vault
              vault_index += 1
              great_vault_list[vault_index] = {}
            end

            encounter.each do |difficulty, ids|
              raid_output["raids_#{difficulty}"] << ids.map{ |id| raid_list[id] && raid_list[id][0] || 0 }.max
              raid_output["raids_#{difficulty}_weekly"] << ids.map{ |id| raid_list[id] && raid_list[id][1] || 0 }.max

              if (boss_ids & ids).any? && for_vault
                great_vault_list[vault_index][difficulty.to_sym] = ids.map{ |id| raid_list[id] && raid_list[id][1] || 0 }.max
              end
            end
          end
        end

        raid_output.lazy.each do |metric, data|
          @character.data[metric] = data.join('|')
        end

        add_great_vault_data(great_vault_list)

        if @achievements
          @character.data['cutting_edge'] =
            CUTTING_EDGE_ACHIEVEMENTS.count{ |raid| @achievements[raid] }
          @character.data['ahead_of_the_curve'] =
            AHEAD_OF_THE_CURVE_ACHIEVEMENTS.count{ |raid| @achievements[raid] }
        end
      end

      def add_great_vault_data(raid_completions)
        raid_bosses_killed = raid_completions.count { |boss, difficulties| difficulties.any? { |diff, killed| killed > 0 } }
        completions_per_difficulty = {
          :mythic => [],
          :heroic => [],
          :normal => [],
          :raid_finder => [],
        }

        raid_completions.values.each do |boss|
          boss.keys.each do |difficulty|
            completions_per_difficulty[difficulty] << (boss[difficulty] > 0 ? difficulty : nil)
          end
        end

        slot_info = raid_completions.keys.map do |boss|
          completions_per_difficulty[:mythic][boss] ||
          completions_per_difficulty[:heroic][boss] ||
          completions_per_difficulty[:normal][boss] ||
          completions_per_difficulty[:raid_finder][boss]
        end.compact.sort_by do |kill|
          completions_per_difficulty.keys.index(kill)
        end

        GREAT_VAULT_RAID_KILLS_NEEDED.each do |slot, kills_needed|
          if GREAT_VAULT_BLACKLISTED_PERIODS.include?(Audit.period)
            @character.data["great_vault_slot_#{slot}"] = ""
          else
            @character.data["great_vault_slot_#{slot}"] = if raid_bosses_killed >= kills_needed
              GREAT_VAULT_TO_ILVL['raid'][slot_info[kills_needed - 1]]
            end || ''
          end
        end

        honor_earned = 0
        highest_rating = 0

        BRACKETS[:live].each do |bracket, endpoint|
          if !@data[endpoint.to_sym][:empty] && @data[endpoint.to_sym][:season][:id] == CURRENT_PVP_SEASON[:live]
            won = @data[endpoint.to_sym].dig(:weekly_match_statistics, :won) || 0
            lost = @data[endpoint.to_sym].dig(:weekly_match_statistics, :lost) || 0

            # Assume that players haven't played more than 3 different days.. Hacky for now
            honor_earned += [won, 3].min * HONOR_PER_WIN[bracket][:daily]
            honor_earned += [won - 3, 0].max * HONOR_PER_WIN[bracket][:win]
            honor_earned += lost * HONOR_PER_WIN[bracket][:loss]

            if @data[endpoint.to_sym][:season][:id] == CURRENT_PVP_SEASON[:live] && won > 0
              highest_rating = [highest_rating, @data[endpoint.to_sym][:rating]].max
            end
          end
        end

        # TODO: Refactor and DRY
        @data.keys.select { |key| key.to_s.include? 'shuffle' }.each do |key|
          next unless bracket = @data[key]

          won = bracket.dig(:weekly_match_statistics, :won) || 0
          lost = bracket.dig(:weekly_match_statistics, :lost) || 0

          honor_earned += [won, 3].min * HONOR_PER_WIN['shuffle'][:daily]
          honor_earned += [won - 3, 0].max * HONOR_PER_WIN['shuffle'][:win]
          honor_earned += lost * HONOR_PER_WIN['shuffle'][:loss]

          if bracket.dig(:season, :id) == CURRENT_PVP_SEASON[:live] && won > 0
            highest_rating = [highest_rating, @data[key][:rating]].max
          end
        end

        item_level = GREAT_VAULT_TO_ILVL['pvp'][GREAT_VAULT_TO_ILVL['pvp'].keys.find { |rating| highest_rating >= rating }]

        if GREAT_VAULT_BLACKLISTED_PERIODS.include?(Audit.period)
          @character.data['great_vault_slot_7'] = ''
          @character.data['great_vault_slot_8'] = ''
          @character.data['great_vault_slot_9'] = ''
        else
          @character.data['great_vault_slot_7'] = honor_earned >= 1250 ? item_level : ''
          @character.data['great_vault_slot_8'] = honor_earned >= 2500 ? item_level : ''
          @character.data['great_vault_slot_9'] = honor_earned >= 5500 ? item_level : ''
        end
      end
    end
  end
end
