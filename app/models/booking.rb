class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat

  validates :starting_date_time, presence: true
  validates :ending_date_time, presence: true
end
