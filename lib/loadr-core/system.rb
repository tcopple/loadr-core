module Loadr
  module Core
    class System
      attr_reader :name
      attr_reader :jobs

      def initialize(args = {})
        @name = args[:name] || raise("Name must be provided to system.")
        @jobs = {} #(job.name -> job) hash
        @graph = DependencyGraph.new
      end

      def add_job(job)
      end

      def add_dependency(independent, dependent)
      end

      def [](index)
      end
    end
  end
end
