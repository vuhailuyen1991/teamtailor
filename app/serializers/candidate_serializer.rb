class CandidateSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :skill, :email, :phone
end
