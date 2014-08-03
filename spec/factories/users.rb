FactoryGirl.define do
  sequence(:user_sequence) { |n| "User#{n}@gmail.com" }
  sequence(:user_id_sequence) { |n| "#{n}" }
  sequence(:token_sequence) { |n| "Token#{n}" }
  
  factory :user do
    id { FactoryGirl.generate(:user_id_sequence) }
    first_name "FirstName"
    last_name "LastName"
    email { FactoryGirl.generate(:user_sequence) }
    password "password123"
    password_confirmation "password123"
  end
  
  factory :admin, class: User do
    id { FactoryGirl.generate(:user_id_sequence) }
    first_name "FirstName"
    last_name "LastName"
    email { FactoryGirl.generate(:user_sequence) }
    password "password123"
    password_confirmation "password123"
    role "admin"
    authentication_token { FactoryGirl.generate(:token_sequence) }
  end
  
  factory :teacher, class: User do
    id { FactoryGirl.generate(:user_id_sequence) }
    first_name "FirstName"
    last_name "LastName"
    email { FactoryGirl.generate(:user_sequence) }
    password "password123"
    password_confirmation "password123"
    role "teacher"
    authentication_token { FactoryGirl.generate(:token_sequence) }
  end
  
  factory :student, class: User do
    id { FactoryGirl.generate(:user_id_sequence) }
    first_name "FirstName"
    last_name "LastName"
    email { FactoryGirl.generate(:user_sequence) }
    password "password123"
    password_confirmation "password123"
    role "student"
    authentication_token { FactoryGirl.generate(:token_sequence) }
  end
  
end
