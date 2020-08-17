class User < ApplicationRecord
  has_many :boats
  has_many :boats, through: :bookings

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
end
