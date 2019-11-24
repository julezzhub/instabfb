class Review < ApplicationRecord
  belongs_to :user
  belongs_to :boyfriend

  has_one :booking, through: :user
  validates :description, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
end
