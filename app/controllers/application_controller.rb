# Base class for all HTTP API controllers.
class ApplicationController < ActionController::Base
  include Pundit

  self.responder = ApplicationResponder

  decent_configuration do
    strategy ApplicationStrategy
  end

  respond_to :html, :json

  protect_from_forgery with: :null_session

  protected

  # Override Devise method for compatibility
  def new_session_path(_scope)
    new_user_session_path
  end
end
