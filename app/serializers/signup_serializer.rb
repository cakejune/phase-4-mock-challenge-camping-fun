class SignupSerializer < ActiveModel::Serializer
  attributes :id, :camper_id, :activity_id, :time, :created_at, :updated_at
end
