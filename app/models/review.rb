class Review < ApplicationRecord
  belongs_to :user
  belongs_to :boyfriend

  has_one :booking, through: :user
  validates :description, presence: true
  validates :rating, includes: { in: [1, 2, 3, 4, 5] }
end
