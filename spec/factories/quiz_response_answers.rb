# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz_response_answer do
       
    association :quiz_response, :factory => :quiz_response
    association :question, :factory => :question
  end
end
