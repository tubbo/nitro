class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.projects
    end
  end
end
