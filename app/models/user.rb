class User < ApplicationRecord
  has_many :boats
  has_many :boats, through: :bookings
end
