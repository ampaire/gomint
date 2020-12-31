class User < ApplicationRecord
	acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :users_roles
  has_many :roles, through: :users_roles
  has_many :vehicles, dependent: :destroy

  # mount_base64_uploader :avatar, AvatarUploader
end
