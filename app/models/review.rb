class Review < ApplicationRecord
  belongs_to :boat
  belongs_to :user

  validates :rating, presence: true
  validates :content, presence: true
end
