class Question < ActiveRecord::Base
  belongs_to :question_category
  has_one :question_answer
end
