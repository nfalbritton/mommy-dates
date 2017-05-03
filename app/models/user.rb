class User < ActiveRecord::Base
  has_many :events
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :zipcode, presence: true, numericality: { only_integer: true }, length: { is: 5 }
  validates :phone, presence: true, numericality: { only_integer: true }, length: { is: 10 }
  validates :avatar_url, presence: true
  validates :about_me, presence: true
end
