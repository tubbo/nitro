# Authentication model for Github-Auth'ed users into the system.
class User < ActiveRecord::Base
  devise :omniauthable, :registerable, :rememberable,
         :trackable, :validatable, :confirmable

  # Create a new +User+ record from GitHub's +OmniAuth+ auth hash.
  #
  # @param [OmniAuth::AuthHash] auth
  # @return [User]
  def self.from_omniauth(auth)
    where(github_id: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end

  # Return the GitHub user record for this User.
  #
  # @return [Github::User]
  def github
    @github ||= Github::User.find name
  end
end
