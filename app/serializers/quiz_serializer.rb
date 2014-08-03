class QuizSerializer < ActiveModel::Serializer
  attributes :id, :shuffle, :timelimit, :attempts, :created_at
  has_many :quiz_questions, key: :questions
end
