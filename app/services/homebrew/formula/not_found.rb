module Homebrew
  class Formula
    # Thrown when a formula canno tbe found in the given tap.
    class NotFound < StandardError
      def initialize(project)
        @project = project
        super "Formula for project '#{@project.name}' was not found in the tap."
      end
    end
  end
end
