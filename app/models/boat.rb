class Boat < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :bookings

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location? # do I change this to location?


  # validates :name, presence: true
  # # validates :type, presence: true
  # validates :price, presence: true
  # validates :location, presence: true
end
