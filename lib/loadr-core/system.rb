module Loadr
  module Core
    class System
      attr_reader :name
      attr_reader :graph

      def initialize(args = {})
        @name = args[:name] || raise("Name must be provided to system.")
        @graph = args[:graph] || DependencyGraph.new
      end

      def add_job(job)
        @graph.add_vertex(job)
      end

      def add_dependency(independent, dependent)
        @graph.add_edge(independent, dependent)
      end

      def jobs
        @graph.vertices.values
      end
    end
  end
end
