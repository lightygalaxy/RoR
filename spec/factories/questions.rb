# Read about factories at https://github.com/thoughtbot/factory_girl

  saved_single_instances = {}
  #Find or create the model instance
  single_instances = lambda do |factory_key|
    begin
      saved_single_instances[factory_key].reload
    rescue NoMethodError, ActiveRecord::RecordNotFound
    #was never created (is nil) or was cleared from db
      saved_single_instances[factory_key] = FactoryGirl.create(factory_key)  #recreate
    end

    return saved_single_instances[factory_key]
  end


FactoryGirl.define do
  sequence(:sequence_name) { |n| "Question#{n}" }

  factory :question do
    name { FactoryGirl.generate(:sequence_name) }
    questionText "Sample Question"
    image "image.jpg"
    version "1.0"
    category_id { FactoryGirl.create(:question_category).id }
    created_by { single_instances[:admin] }
    modified_by { single_instances[:admin] }
  end

end
