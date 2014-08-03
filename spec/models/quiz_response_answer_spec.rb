require 'spec_helper'

describe QuizResponseAnswer do
  let(:quiz_response_answer) { FactoryGirl.build(:quiz_response_answer) }

  it { should be_valid }
end
