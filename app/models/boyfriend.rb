class Boyfriend < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :images
  has_many :bookings
  validates :name, presence: true
  validates :description, presence: true
  validates :height, presence: true
  validates :pet, presence: true
  validates :likes, presence: true
  validates :location, presence: true
  accepts_nested_attributes_for :images
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  def self.range_likes(min, max)
    Boyfriend.all.select { |boyfriend| (boyfriend.likes >= min && boyfriend.likes <= max) }
  end
end
