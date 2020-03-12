class SurveySerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
  has_many :questions
  has_many :user_survey_joiners
  has_many :favorites
end
