require 'spec_helper'

describe QuizQuestion do
  let(:quiz_question) { FactoryGirl.build(:quiz_question) }

  it { should be_valid }
end
