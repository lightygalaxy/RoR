class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :name, :questionText, :qtype, :possible_values, :version, :image
end
