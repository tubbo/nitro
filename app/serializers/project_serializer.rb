# Presents a Project for the JSON API
class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :user
end
