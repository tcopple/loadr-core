require_relative '../spec_helper'

describe Loadr do
  it 'version must be defined' do
    Loadr::Core::VERSION.should_not be_nil
  end
end
