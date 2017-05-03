
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar_url, AvatarURLUploader

  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :zipcode, presence: true, numericality: {length: 5}
  validates :phone, presence: true, numericality: {length: 10}
  validates :avatar_url, presence: true
  validates :about_me, presence: true
end
