class CreateGithubReleaseJob < ActiveJob::Base
  queue_as :releases

  def perform(release)
    github_release = Github::Release.create(
      repository: release.repository,
      ref: release.ref
    )
    release.update github_release_id: github_release.id
    release.tap.update release.formula
  end
end
