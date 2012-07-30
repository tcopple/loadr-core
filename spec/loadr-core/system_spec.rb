require_relative '../spec_helper'

describe Loadr::Core::System do
  let(:jfoo) { Loadr::Core::Job.new(name: "foo") }
  let(:jbar) { Loadr::Core::Job.new(name: "bar") }
  let(:jbaz) { Loadr::Core::Job.new(name: "baz") }

  subject { Loadr::Core::System.new({name: 'FooBarBaz'}) }

  describe ".initialize(args = {})" do
    it "should ensure required args are passed in" do
      val = "SystemFoo"

      s = Loadr::Core::System.new({name: val})
      s.name.should eq(val)
    end

    it "should raise an error if name is not given in args" do
      lambda { Loadr::Core::System.new({}) }.should raise_error(RuntimeError)
    end
  end

  describe ".add_job(job)" do
    it "should increase the total number of jobs by one" do
      subject.jobs.should be_empty
      subject.add_job(jfoo)
      subject.jobs.should eq([jfoo])
    end

    it "adding the same job twice shouldn't increase the job count" do
      subject.jobs.should be_empty
      subject.add_job(jfoo)
      subject.add_job(jfoo)
      subject.jobs.should eq([jfoo])
    end
  end

  describe ".add_dependency(independent, dependent)" do
    #nothing here because the method just calls out to a memeber method that is tested.
  end

  describe ".jobs" do
    #nothing here because the method just calls out to a memeber method that is tested.
  end
end
