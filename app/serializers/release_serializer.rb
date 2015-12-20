class ReleaseSerializer < ActiveModel::Serializer
  attributes :id, :github_release_id
  has_one :project
end
