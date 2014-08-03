# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz_user do
 
 
    assigned_to { FactoryGirl.create(:student).id }
    assigned_by  { FactoryGirl.create(:teacher).id }

    association :quiz, :factory => :quiz
  end
end
