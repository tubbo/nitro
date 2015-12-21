class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth auth_hash

    if @user.valid?
      sign_in_and_redirect @user, event: :authenticated
      set_flash_message :notice, :success, kind: 'GitHub'
    else
      redirect_to root_path, alert: "Failed to authenticate."
    end
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
