require 'spec_helper'

describe Question do
  let(:question) { FactoryGirl.build(:question) }

  it { should be_valid }
end