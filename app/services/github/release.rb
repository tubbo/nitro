module Github
  # Represents a release registered on Github for a given project.
  class Release
    attr_reader :repository, :ref

    def initialize(repo: nil, ref: '')
      @repository = repo
      @ref = ref
    end

    def self.create(params = {})
      release = new(**params)
      release.save
      release
    end

    def save
      valid? && create
    end

    def valid?
      repository.present? && ref.present?
    end

    def persisted?
      @release.present?
    end

    private

    def create
      @release = repository.create_release(
        tag_name: ref,
        name: ref,
        draft: true
      )
    end
  end
end
