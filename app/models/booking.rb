class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  has_many :reviews # check the names of everything

  # validates :starting_date_time, presence: true
  # validates :ending_date_time, presence: true
end
