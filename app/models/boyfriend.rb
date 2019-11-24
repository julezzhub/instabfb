class Boyfriend < ApplicationRecord
  belongs_to :user

  has_many :reviews, :images, :bookings
  validates :name, presence: true
  validates :description, presence: true
end
