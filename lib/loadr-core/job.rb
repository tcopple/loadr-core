module Loadr
  module Core
    class Job
      attr_accessor :params
      attr_reader :name

      def initialize(args = {})
        @name = args[:name] || raise("Name must be provided to job.")
      end
    end
  end
end
