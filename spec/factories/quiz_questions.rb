# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz_question do

    marks { rand(4) }
    
    association :quiz, :factory => :quiz
    association :question, :factory => :question
  end
end
