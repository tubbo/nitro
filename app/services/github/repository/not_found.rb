module Github
  class Repository
    # Thrown when a repository cannot be found.
    class NotFound < RuntimeError
      def initialize(user, name)
        @user = user
        @repo_name = name
        super "GitHub Repository not found for '#{user}/#{name}'"
      end
    end
  end
end
