require_relative '../spec_helper'

describe Loadr::Core::DependencyGraph do
  let(:graph) { Loadr::Core::DependencyGraph.new }
  let(:vfoo) { "foo" }
  let(:vbar) { "bar" }
  let(:vbaz) { "baz" }

  subject { graph }

  describe '.initialize(args = {})' do
    it "should set @edges to an empty set" do
      Loadr::Core::DependencyGraph.new.edges.should == Set.new
    end

    it "should set @vertices to an empty hash" do
      Loadr::Core::DependencyGraph.new.vertices.should == Hash.new
    end
  end

  describe '.add_vertex(vertex)' do
    it "should add the vertex to the vertices list" do
      subject.vertices.should be_empty
      subject.add_vertex(vfoo)
      subject.vertices.should eq({vfoo.object_id => vfoo})
    end

    context 'when vertex already exists' do
      it "shouldn't store the vertex again" do
        2.times { subject.add_vertex(vfoo) }
        subject.vertices.should eq({vfoo.object_id => vfoo})
      end
    end
  end

  describe '.add_edge(source, sink)' do
    it "should add an edge between the source and sink object ids" do
      subject.add_edge(vfoo, vbar)
      subject.edges.select do |edge|
        edge.first == vfoo.object_id and edge.last == vbar.object_id
      end.should_not be_empty
    end

    it "should not add multiple edges for the same source and sink pair" do
      subject.add_edge(vfoo, vbar)
      subject.add_edge(vfoo, vbar)

      subject.edges.count.should eq(1)
    end

    it "should add extra edge when reciprocal of pair is provided" do
      subject.add_edge(vfoo, vbar)
      subject.add_edge(vbar, vfoo)

      subject.edges.count.should eq(2)
    end
  end

  describe '.sources_to(vertex)' do
    it "should return an array of vertices that point to given vertex" do
      subject.add_edge(vfoo, vbar)
      subject.add_edge(vbaz, vbar)

      subject.sources_to(vbar).sort.should eq([vfoo, vbaz].sort)
      subject.sources_to(vfoo).should be_empty
    end
  end

  describe '.sinks_from(vertex)' do
    it "should return an array of vertices that are pointed to by a given vertex" do
      subject.add_edge(vfoo, vbar)
      subject.add_edge(vfoo, vbaz)

      subject.sinks_from(vfoo).sort.should eq([vbar, vbaz].sort)
      subject.sinks_from(vbar).should be_empty
    end
  end
end
