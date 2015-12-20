# GitHub API service classes that wrap +Octokit+.
module Github
  # OAuth App ID from the GitHub API.
  def self.app_id
    Rails.application.secrets.github_app_id
  end

  # OAuth App Secret from the GitHub API.
  def self.app_secret
    Rails.application.secrets.github_app_secret
  end

  # OAuth authenticated scope from the GitHub API.
  def self.scope
    Rails.application.secrets.github_auth_scope
  end
end
