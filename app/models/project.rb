# A GitHub repository that is building packages with this service. Owned
# by a User and builds Package records.
class Project < ActiveRecord::Base
  belongs_to :user

  has_many :releases

  validates :user, presence: true
  validates :name, presence: true, uniqueness: { scope: :user }
  validates :repository, presence: { message: 'not found' }
  validates :tap, presence: { message: 'not found' }

  # Git repo this project is contained in.
  #
  # @return [Github::Repository]
  def repository
    @repository ||= Github::Repository.find user: user, name: name
  end

  # The Homebrew tap that this project is located in.
  #
  # @return [Homebrew::Tap]
  def homebrew_tap
    @homebrew_tap ||= Homebrew::Tap.find user
  end
end
