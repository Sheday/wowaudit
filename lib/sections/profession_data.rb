module Audit
  class ProfessionData < Data
    def add
      if @data[:professions].class == RBattlenet::HashResult && @data[:professions]['primaries']
        spark_items = []
        professions = @data[:professions]['primaries'].select{ |p| BASE_PROFESSIONS.keys.include?(p['profession']['id']) }

        professions.each_with_index do |profession, index|
          tier = (profession['tiers'] || []).select{ |tier| DF_PROFESSIONS.keys.include?(tier['tier']['id']) }.first
          @character.data["profession_#{index + 1}"] = "#{profession['profession']['name']} (#{tier ? tier['skill_points'] : '0'})"

          if tier
            spark_items += tier['known_recipes'].map do |recipe|
              SPARK_RECIPE_NAME_TO_ITEM_ID[recipe[F_NAME]][:id] if SPARK_RECIPE_NAME_TO_ITEM_ID.keys.include?(recipe[F_NAME])
            end.compact
          end
        end

        @character.data['profession_recipes'] = "|#{spark_items.join('|')}|"
      end
    end
  end
end
