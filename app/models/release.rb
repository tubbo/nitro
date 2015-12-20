class Release < ActiveRecord::Base
  belongs_to :project

  validates :project, presence: true
  validates :github_release_id, presence: true

  delegate :tap, to: :project

  after_create :update_formula

  def github_release
    @github_release ||= Github::Release.find github_release_id
  end

  def tap
    "#{project.user.name}/homebrew-tap"
  end

  private

  def update_formula
    UpdateHomebrewFormula.perform_later self
  end
end
