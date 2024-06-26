module Audit
  module Live
    class GearData < Data
      def add
        # Check equipped gear
        items_equipped = 0
        sparks_used = 0
        embellished_found = 0
        total_upgrades_missing = 0
        @character.data['empty_sockets'] = 0
        @character.data['epic_gem'] = 0
        @character.data["food_embellishment"] = 'no'

        # Quickfix to not have a 0 returned, which messes up the spreadsheet
        @character.data["enchant_quality_off_hand"] = ''
        @character.data["off_hand_enchant"] = ''
        @character.data["upgrade_level_off_hand"] = ''

        # Wipe current gear (it will be repopulated)
        @character.details['current_gear'] = {}

        ITEMS[:live].each do |item|
          @character.data["tier_#{item}_difficulty"] = ''

          begin
            equipped_item = @data[:equipment][:equipped_items].lazy.select{ |eq_item| eq_item[:slot][:type] == item.upcase }.first
            if !check_onyx_annulet(item, equipped_item)
              @character.ilvl += equipped_item[:level][:value]
              @character.data[item + '_ilvl'] = equipped_item[:level][:value]
            end
            @character.data[item + '_id'] = equipped_item[:item][:id]
            @character.data[item + '_name'] = equipped_item[:name]
            @character.data[item + '_quality'] = QUALITIES[equipped_item[:quality][:type].to_sym]
          rescue => err
            @character.data[item + '_ilvl'] = ''
            @character.data[item + '_id'] = ''
            @character.data[item + '_name'] = ''
            @character.data[item + '_quality'] = ''
          end

          begin
            equipped_item = @data[:equipment][:equipped_items].lazy.select{ |eq_item| eq_item[:slot][:type] == item.upcase }.first
            next unless equipped_item

            embellished_found += check_embellished(embellished_found, item, equipped_item)
            items_equipped += 1

            if equipped_item.dig(:name_description, :display_string) == "Awakened Crafted"
              # 2 handed weapons cost 2 sparks
              sparks_used += (equipped_item[:inventory_type][:type] == "TWOHWEAPON" || (equipped_item[:inventory_type][:name] == "Ranged" && equipped_item.dig(:weapon, :damage, :damage_class, :type) == "PHYSICAL") ? 2 : 1)

              @character.details['spark_gear_s4'][item] = {
                'ilvl' => equipped_item[:level][:value],
                'id' => equipped_item[:item][:id],
                'name' => equipped_item[:name],
                'quality' => QUALITIES[equipped_item[:quality][:type].to_sym]
              }
            end

            bonus_list = equipped_item[:bonus_list] || []
            if (bonus_list & ((10490..10503).to_a + (10407..10418).to_a + (10951..10964).to_a)).any?
              (@character.details['bullion_ids'] += [equipped_item[:item][:id]]).uniq!
            end

            upgrade_id = bonus_list.find { |bonus_id| UPGRADE_BONUS_IDS.keys.include? bonus_id }
            track = UPGRADE_BONUS_IDS_BY_DIFFICULTY.values.find { |ids| ids.include? upgrade_id.to_i }
            @character.data["upgrade_level_#{item}"] = track ? "#{track.index(upgrade_id) + 1} / #{track.size}" : '-'
            total_upgrades_missing += (track.size - (track.index(upgrade_id) + 1)) if track

            @character.details['current_gear'][item] = {
              'ilvl' => equipped_item[:level][:value],
              'id' => equipped_item[:item][:id],
              'bonus_ids' => bonus_list,
              'name' => equipped_item[:name],
              'enchant' => check_enchant(item, equipped_item),
              'sockets' => check_sockets(item, equipped_item),
              'quality' => QUALITIES[equipped_item[:quality][:type].to_sym],
              'upgrade_level' => @character.data["upgrade_level_#{item}"],
            }

            if equipped_item[:level][:value] >= @character.details['best_gear'][item]['ilvl'].to_f
              @character.details['best_gear'][item] = @character.details['current_gear'][item]
            end

            if TIER_ITEMS_BY_SLOT.keys.include? item
              # Convert legacy format stored tier data
              if @character.details['tier_items_s4'][item].is_a?(Integer)
                @character.details['tier_items_s4'][item] = {
                  'ilvl' => @character.details['tier_items_s4'][item],
                  'difficulty' => LEGACY_TIER_CUTOFFS.map { |cutoff, string| string if cutoff <= @character.details['tier_items_s4'][item] }.compact.last || ''
                }
              end

              if TIER_ITEMS.include?(equipped_item[:item][:id].to_i) && equipped_item[:level][:value] >= (@character.details.dig('tier_items_s4', item, 'ilvl') || 0)
                upgradeable_difficulty = UPGRADE_BONUS_IDS[bonus_list.find { |bonus_id| UPGRADE_BONUS_IDS.keys.include? bonus_id }]
                @character.details['tier_items_s4'][item] = {
                  'ilvl' => equipped_item[:level][:value],
                  'difficulty' => upgradeable_difficulty || LEGACY_TIER_CUTOFFS.map { |cutoff, string| string if cutoff <= equipped_item[:level][:value] }.compact.last || ''
                }
              end

              @character.data["tier_#{item}_ilvl"] = @character.details['tier_items_s4'][item]['ilvl']
              @character.data["tier_#{item}_difficulty"] = @character.details['tier_items_s4'][item]['difficulty']
            end
          rescue => err
            puts err
            nil # Don't care about supplemental information if something goes wrong, somehow...
          end

          @character.data["best_#{item}_ilvl"] = @character.details['best_gear'][item]['ilvl'] || ''
          @character.data["best_#{item}_id"] = @character.details['best_gear'][item]['id'] || ''
          @character.data["best_#{item}_name"] = @character.details['best_gear'][item]['name'] || ''
          @character.data["best_#{item}_quality"] = @character.details['best_gear'][item]['quality'] || ''

          @character.data["spark_#{item}_ilvl"] = @character.details['spark_gear_s4'][item]['ilvl'] || ''
          @character.data["spark_#{item}_id"] = @character.details['spark_gear_s4'][item]['id'] || ''
          @character.data["spark_#{item}_name"] = @character.details['spark_gear_s4'][item]['name'] || ''
          @character.data["spark_#{item}_quality"] = @character.details['spark_gear_s4'][item]['quality'] || ''
        end

        # For 2H weapons the item level is counted twice to normalise between weapon types
        if @data[:equipment][:equipped_items] && !@data[:equipment][:equipped_items].any?{ |eq_item| eq_item[:slot][:type] == "OFF_HAND" }
          items_equipped += 1
          @character.ilvl += @data[:equipment][:equipped_items].select{ |eq_item| eq_item[:slot][:type] == "MAIN_HAND" }.first[:level][:value] rescue 0
        end

        @character.data['ilvl'] = (@character.ilvl / ([items_equipped, 1].max)).round(2) rescue 0
        @character.data['ingenuity_sparks_equipped'] = sparks_used
        @character.data['total_upgrades_missing'] = total_upgrades_missing
        @character.data['bullion_items'] = @character.details['bullion_ids'].size

        @character.details['max_ilvl'] = [@character.data['ilvl'], @character.details['max_ilvl'].to_f].max
        @character.data['highest_ilvl_ever_equipped'] = @character.details['max_ilvl']
        @character.data['gem_list'] = @character.gems.join('|')
      end

      def check_enchant(item, equipped_item)
        if ENCHANTS.include? item
          begin
            # Off-hand items that are not weapons can't be enchanted
            return if !equipped_item&.dig(:weapon) && item == "off_hand"

            if (match = equipped_item[:enchantments].map { |e| ENCHANTS[item][e[:enchantment_id]] }.compact.first)
              @character.data["enchant_quality_#{item}"] = match[0]
              @character.data["#{item}_enchant"] = match[1] || ''
            else
              name = equipped_item[:enchantments].first[:display_string].split('Enchanted: ').reject(&:empty?).first.split(' |').first
              quality = (equipped_item[:enchantments].first[:display_string].split('Tier')[1])

              @character.data["#{item}_enchant"] = name
              @character.data["enchant_quality_#{item}"] = quality
            end
          rescue
            # Don't require the stamina belt clasp on casual or lenient modes
            @character.data["enchant_quality_#{item}"] = item == 'waist' ? 3 : 0
            @character.data["#{item}_enchant"] = ''
          end

          { name: @character.data["#{item}_enchant"], quality: @character.data["enchant_quality_#{item}"], id: equipped_item[:enchantments]&.first&.dig(:enchantment_id) }
        elsif item == 'neck'
          @character.data["enchant_quality_#{item}"] = equipped_item&.dig(:sockets)&.size == 3 ? 4 : 0

          nil
        end
      end

      def check_sockets(item, equipped_item)
        socket_info = []

        (equipped_item[:sockets] || []).each do |socket|
          if has_gem = GEMS[socket.dig(:item, :id)]
            @character.gems << has_gem

            if epic_gem = EPIC_GEMS[socket.dig(:item, :id)]
              @character.data['epic_gem'] = epic_gem
            end
          elsif !socket.dig(:item, :id) && socket.dig(:socket_type, :type) != "TINKER"
            @character.data['empty_sockets'] += 1
          end

          socket_info << { type: socket.dig(:socket_type, :type), gem: socket.dig(:item, :id) }
        end

        socket_info
      end

      def check_onyx_annulet(item, equipped_item)
        if equipped_item[:name] == 'Onyx Annulet'
          equipped_item[:sockets].sort_by { |socket| socket.dig(:item, :name) || "" }.each_with_index do |socket, index|
            @character.data["primordial_stone_#{index + 1}_id"] = socket.dig(:item, :id)
            @character.data["primordial_stone_#{index + 1}_name"] = socket.dig(:item, :name)&.split(" ")&.first
          end

          # Item level is bugged at the moment on the Armory, correct it here
          @character.data["onyx_annulet_ilvl"] = 405 + ((equipped_item.dig(:level, :value) - 405) / 2)
          @character.ilvl += @character.data["onyx_annulet_ilvl"]
          @character.data[item + '_ilvl'] = @character.data["onyx_annulet_ilvl"]

          true
        end
      end

      def check_embellished(occurrence, item, equipped_item)
        if (equipped_item[:spells] || []).any? { |spell| spell.dig(:spell, :id) == 372120 }
          @character.data["food_embellishment"] = 'yes'
        end

        # Scuffed, improve
        @character.data["embellished_item_id_#{occurrence + 1}"] = ''
        @character.data["embellished_item_level_#{occurrence + 1}"] = ''
        @character.data["embellished_spell_id_#{occurrence + 1}"] = ''
        @character.data["embellished_spell_name_#{occurrence + 1}"] = ''
        @character.data["embellished_item_id_#{occurrence + 2}"] = ''
        @character.data["embellished_item_level_#{occurrence + 2}"] = ''
        @character.data["embellished_spell_id_#{occurrence + 2}"] = ''
        @character.data["embellished_spell_name_#{occurrence + 2}"] = ''

        if equipped_item[:limit_category] == 'Unique-Equipped: Embellished (2)'
          @character.data["embellished_item_id_#{occurrence + 1}"] = equipped_item[:item][:id]
          @character.data["embellished_item_level_#{occurrence + 1}"] = equipped_item[:level][:value]

          if equipped_item[:spells]
            @character.data["embellished_spell_id_#{occurrence + 1}"] = equipped_item[:spells][0].dig(:spell, :id)
            @character.data["embellished_spell_name_#{occurrence + 1}"] = equipped_item[:spells][0].dig(:spell, :name)
          else
            @character.data["embellished_spell_id_#{occurrence + 1}"] = equipped_item[:item][:id]
            @character.data["embellished_spell_name_#{occurrence + 1}"] = equipped_item[:name]
          end
          1
        else
          0
        end
      end
    end
  end
end
