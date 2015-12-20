# Authentication model for Github-Auth'ed users into the system.
class User < ActiveRecord::Base
  devise :omniauthable, :registerable, :rememberable,
         :trackable, :validatable, :confirmable
end
