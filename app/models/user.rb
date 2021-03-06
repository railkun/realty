class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :comments
    has_many :properties

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true

  mount_uploader :avatar, AvatarUploader
end
