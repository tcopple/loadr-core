module Loadr
  module Core
    class SystemContext
      attr_reader :id
      attr_reader :definition

      def self.make(system, args = {})
        SystemContext.new({system: system}.merge(args))
      end

      def go
      end

      private
      def initialize(args = {})
        @id = SecureRandom.uuid
        @definition = args[:system] || raise("System must be provided to SystemContext constructor.")
      end
    end
  end
end
