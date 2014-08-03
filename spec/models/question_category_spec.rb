require 'spec_helper'

describe QuestionCategory do
  let(:question_category) { FactoryGirl.build(:question_category) }

  it { should be_valid }
end
