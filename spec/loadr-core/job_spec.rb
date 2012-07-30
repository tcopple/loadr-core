require_relative "../spec_helper"

describe Loadr::Core::Job do
  let(:name) { "job_foo" }
  let(:system) { Loadr::Core::System.new(name: 'FooBarBaz System') }
  let(:job) { Loadr::Core::Job.new({system: system, name: name}) }

  subject { job }

  describe ".initialize(args = {})" do
    it "should set required args passed in" do
      j = Loadr::Core::Job.new({system: system, name: name})
      j.name.should eq(name)
    end

    it "should raise an error if name is not given in args" do
      lambda { Loadr::Core::Job.new({system: system}) }.should raise_error(RuntimeError)
    end
  end
end
