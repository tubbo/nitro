# A GitHub repository that is building packages with this service. Owned
# by a User and builds Package records.
class Project < ActiveRecord::Base
  belongs_to :user

  has_many :releases

  validates :user, presence: true
  validates :name, presence: true, uniqueness: { scope: :user }

  def repository
    @repository ||= Github::Repository.find user: user, name: name
  end

  def tap
    "#{user.name}/homebrew-tap"
  end
end
