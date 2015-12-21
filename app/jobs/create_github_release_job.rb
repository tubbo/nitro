# Creates a GitHub release via the API and assigns it to the given SHA,
# then assigns the release ID back to the release record.
class CreateGithubReleaseJob < ActiveJob::Base
  queue_as :default

  def perform(release)
    release.update(
      github_release_id: Github::Release.create(
        repo: release.repository,
        ref: release.ref
      ).id
    )
    UpdateHomebrewTapJob.perform_later release
  end
end
