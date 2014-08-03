# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question_answer do
    answer "Test"
    
    association :question, :factory => :question
  end
end
