module Audit
  module Live
    class QuestData < Data
      def add
        if @achievements
          @character.data['quests_done_total'] = @achievements[508][:criteria][:child_criteria].first[:amount] rescue 0
          @character.data['wqs_done_total'] = @achievements[11132][:criteria][:child_criteria].first[:amount] rescue 0
          @character.data['dailies_done_total'] = @achievements[977][:criteria][:child_criteria].first[:amount] rescue 0
        end


        last_hurrah_id =  [80385, 80386, 80388][(Audit.period - 956) % 3]
        @character.data['aiding_the_accord'] = @data.dig(:completed_quests, :quests)&.lazy&.any? { |quest| quest[:id] == last_hurrah_id } ? 'yes' : 'no'

        @character.data['weekly_feast'] = @data.dig(:completed_quests, :quests)&.lazy&.any? { |quest| quest[:id] == 70893 } ? 'yes' : 'no'

        unless !@data[:completed_quests]
          @character.data['weekly_event_completed'] = @data.dig(:completed_quests, :quests)&.lazy&.any? { |quest| WEEKLY_EVENT_QUESTS.include? quest[:id] } ? 'yes' : 'no'
        end
      end
    end
  end
end
