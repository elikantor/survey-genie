class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :content, :total, :question_id
end
