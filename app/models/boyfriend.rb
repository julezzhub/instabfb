class Boyfriend < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :images
  has_many :bookings
  validates :name, presence: true
  validates :description, presence: true
  accepts_nested_attributes_for :images

  def self.range_likes(min, max)
    Boyfriend.all.select { |boyfriend| (boyfriend.likes >= min && boyfriend.likes <= max) }
  end
end
