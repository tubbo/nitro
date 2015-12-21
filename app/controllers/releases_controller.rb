# Releases API. Create and show releases.
class ReleasesController < ApplicationController
  before_action :authenticate_user!
  expose :project
  resource :release

  def index
    respond_with releases
  end

  def create
    release.attributes = permitted_params(release)
    release.save
    respond_with release
  end

  def show
    respond_with release
  end
end
