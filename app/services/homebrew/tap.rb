module Homebrew
  # Communicates with the tap repository to update formulae
  class Tap
    # Conventional name used for all homebrew taps.
    NAME = 'homebrew-tap'

    def initialize(user: User.new)
      @user = user
    end

    def include?(formula_name)
      repo.files.include? "#{formula_name}.rb"
    end

    def update(name: '', file: '', contents: '')
      repo.commit "Update #{name}", file => contents
    end

    private

    def repo
      @repo ||= Github::Repository.find user, NAME
    end
  end
end
