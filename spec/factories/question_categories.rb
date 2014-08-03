# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:category_name) { |n| "Category#{n}" }
  
  factory :question_category do
    name { FactoryGirl.generate(:category_name) }
    info "Sample Info"
   end
end
