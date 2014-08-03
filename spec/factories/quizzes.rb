# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz do
    shuffle false
    timelimit 1
    attempts 1
    
    created_by  { FactoryGirl.create(:teacher).id }
    modified_by { FactoryGirl.create(:teacher).id }
    
  end
end
