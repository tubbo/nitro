# Presents a release for the JSON API
class ReleaseSerializer < ActiveModel::Serializer
  attributes :id, :github_release_id, :title, :description, :ref
  has_one :project

  def homebrew_tap
    model.homebrew_tap.url
  end

  def repository
    model.repository.url
  end
end
