require 'set'

module Loadr
  module Core
    class DependencyGraph
      attr_reader :vertices
      attr_reader :edges

      def initialize
        @edges = Set.new
        @vertices = Hash.new
      end

      def add_vertex(vertex)
        @vertices[vertex.object_id] = vertex
      end

      def add_edge(source, sink)
        #add vertex to map if it doesn't already exist
        [source, sink].map { |v| add_vertex(v) if @vertices[v.object_id].nil? }

        @edges << [source.object_id, sink.object_id]
      end

      def sources_to(vertex)
        @edges.select{ |e| e.last == vertex.object_id }.map(&:first).collect{ |id| @vertices[id] }
      end

      def sinks_from(vertex)
        @edges.select{ |e| e.first == vertex.object_id }.map(&:last).collect{ |id| @vertices[id] }
      end

      def each(&block)
        #current starts a list of jobs with no dependencies
        current = @vertices.select{ |v| sources_to(v).empty? }.flatten

        while(!current.empty?) do
          itr = current.collect{ |v| sinks_from(v) }.flatten.uniq
          yield current
          current = itr
        end
      end
    end
  end
end
