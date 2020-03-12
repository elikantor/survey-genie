class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :content, :survey_id
  has_many :answers
end
