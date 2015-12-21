module Github
  # Creates a commit on a given repo (usually the tap) to add a new
  # change.
  class Commit
    attr_reader :repository
    attr_reader :message
    attr_reader :changes

    def initialize(repository: '', message: '', changes: {})
      @repository = repository
      @message = message
      @changes = changes
    end

    def self.create(params = {})
      commit = new(**params)
      commit.save
      commit
    end

    def valid?
      repository.present? && message.present? && changes.present?
    end

    def save
      valid? && create
    end

    private

    def create
    end
  end
end
