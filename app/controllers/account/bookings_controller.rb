class Account::BookingsController < ApplicationController
	
  def show
    @all_bookings = Booking.where(user: current_user)
    @current_bookings = @all_bookings.select { |booking| booking.end_date > Date.today }
    @past_bookings = @all_bookings.select { |booking| booking.end_date < Date.today }
  end
end