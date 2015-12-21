class ReleasePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  protected

  def owner?
    user.projects.include? record.project
  end
end
