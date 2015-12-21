# Makes a pull request to the Homebrew tap to update the given file.
class UpdateHomebrewTapJob < ActiveJob::Base
  queue_as :default

  def perform(release)
    release.tap.update(
      name: "Update #{release.formula.name}",
      file: release.formula.file_name,
      contents: release.formula.contents
    )
  end
end
