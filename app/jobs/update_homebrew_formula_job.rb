class UpdateHomebrewFormulaJob < ActiveJob::Base
  queue_as :formulae

  def perform(release)
    formula = Homebrew::Formula.find(release.project)
    formula.update sha: release.sha
  end
end
