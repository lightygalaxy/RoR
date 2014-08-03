class Quiz < ActiveRecord::Base
  has_many :quiz_users
  has_many :quiz_questions
  has_many :quiz_responses
end
