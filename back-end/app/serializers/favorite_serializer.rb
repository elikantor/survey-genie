class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :survey_id
end
