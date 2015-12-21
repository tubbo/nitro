module Github
  # Basic wrapper for a user on the GitHub API
  class User
    attr_reader :name

    def initialize(name: '')
      @name = name
      @user = Octokit.user(name)
    end

    def valid?
      @user.present?
    end
  end
end
