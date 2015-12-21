module Github
  # Model wrapper for a GitHub Repository, can create and find repos as
  # well as create releases.
  class Repository
    attr_reader :user
    attr_reader :name

    def initialize(user: nil, name: '')
      @user = Octokit.user(user.name)
      @name = name
    end

    def self.find(user: User.new, name: '')
      repo = new user: user, name: name
      fail NotFound user, name unless repo.persisted?
      repo
    end

    def self.create(user: User.new, name: '')
      repo = new user: user, name: name
      repo.save
      repo
    end

    def valid?
      user.present? && name.present?
    end

    def persisted?
      repo.present?
    end

    def path
      "#{user.name}/#{name}"
    end

    def save
      valid? && create && persisted?
    end

    def commit(message = '', changes = {})
      Github::Commit.create(
        repository: self,
        message: message,
        changes: changes
      )
    end

    private

    def repo
      @repo ||= user.repositories.find(name)
    end

    def create
      @repo = user.create_repository(
        name,
        description: 'Private Homebrew tap',
        has_downloads: true,
        auto_init: true
      )
    end
  end
end
