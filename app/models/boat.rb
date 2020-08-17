class Boat < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :bookings

  validates :name, presence: true
  validates :type, presence: true
  validates :price, presence: true
  validates :location, presence: true
end
