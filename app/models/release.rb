class Release < ActiveRecord::Base
  belongs_to :project

  validates :project, presence: true
  validates :ref, presence: true

  delegate :homebrew_tap, :repository, to: :project
  delegate :title, :description, to: :github_release

  after_create :create_github_release

  def github_release
    @github_release ||= Github::Release.find github_release_id
  end

  def formula
    @formula ||= Homebrew::Formula.new(
      homebrew_tap: homebrew_tap,
      release: github_release
    )
  end

  private

  def create_github_release
    CreateGithubRelease.perform_later self
  end
end
