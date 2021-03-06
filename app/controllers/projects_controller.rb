# Projects API. Create, destroy, and show projects.
class ProjectsController < ApplicationController
  before_action :authenticate_user!
  resource :project

  def index
    respond_with projects
  end

  def create
    project.attributes = permitted_params(project)
    project.save
    respond_with project
  end

  def show
    respond_with project
  end

  def destroy
    project.destroy
    respond_with project
  end
end
