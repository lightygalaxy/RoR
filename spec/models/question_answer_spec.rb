require 'spec_helper'

describe QuestionAnswer do
  let(:question_answer) { FactoryGirl.build(:question_answer) }

  it { should be_valid }
end
