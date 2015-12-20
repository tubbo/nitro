module Github
  class Commit
    def initialize(repository: '', message: '', changes: {})
    end

    def self.create(params = {})
      commit = new(**params)
      commit.save
      commit
    end
  end
end
