class QuizResponse < ActiveRecord::Base
  belongs_to :quiz
  has_many :quiz_response_answers
end
