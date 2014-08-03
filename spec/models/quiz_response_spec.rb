require 'spec_helper'

describe QuizResponse do
  let(:quiz_response) { FactoryGirl.build(:quiz_response) }

  it { should be_valid }
end
