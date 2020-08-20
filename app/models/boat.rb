class Boat < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :bookings
  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location? # do I change this to location?


  # validates :name, presence: true
  # # validates :type, presence: true
  # validates :price, presence: true
  # validates :location, presence: true
  validates :photo, presence: true
end
