require 'spec_helper'

describe QuizUser do
  let(:quiz_user) { FactoryGirl.build(:quiz_user) }

  it { should be_valid }
end
