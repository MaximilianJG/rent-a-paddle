class User < ApplicationRecord
  has_many :boats
  has_many :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: :true
  validates :password, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
end
