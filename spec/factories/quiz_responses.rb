# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz_response do

    sequence(:timestart) { |n| Time.now + n.hours }
    sequence(:timefinish) { |n| Time.now + n.hours + 1.hour }
    
    submitted_by { FactoryGirl.create(:student).id }
    
    association :quiz, :factory => :quiz    
  end
end
