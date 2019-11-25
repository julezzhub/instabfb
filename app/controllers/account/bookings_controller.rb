class Account::BookingsController < ApplicationController

  def show
    @current_bookings = Booking.where(user: current_user)
    @past_bookings = @current_bookings.select { |booking| booking.end_date < Date.today }
  end
end