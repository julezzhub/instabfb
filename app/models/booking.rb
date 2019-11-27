class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boyfriend

  validates :start_date, :end_date, presence: true
  validate :check_date

  private

  def check_date
    errors.add(:start_date, "Invalid: The Start-date must be before the End-date!") if start_date > end_date
  end
end
