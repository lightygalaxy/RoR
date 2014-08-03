class QuizQuestionSerializer < ActiveModel::Serializer
  attributes :marks
  has_one :question
end
