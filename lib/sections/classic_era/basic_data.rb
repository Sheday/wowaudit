module Audit
  module ClassicEra
    class BasicData < Data
      SKIPPABLE = false

      def add
        Audit::Live::BasicData.new(@character, @data, @skipped, @realm, @temp_character).add
      end
    end
  end
end
