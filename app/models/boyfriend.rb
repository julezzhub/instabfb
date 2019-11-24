class Boyfriend < ApplicationRecord
  belongs_to :user

  has_many :reviews
  has_many :images
  has_many :bookings
  validates :name, presence: true
  validates :description, presence: true
end
