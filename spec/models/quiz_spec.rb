require 'spec_helper'

describe Quiz do
  let(:quiz) { FactoryGirl.build(:quiz) }

  it { should be_valid }
end
