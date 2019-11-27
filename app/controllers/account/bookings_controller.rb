class Account::BookingsController < ApplicationController

  def policy_scope(scope)
    super([:account, scope])
  end

  def index
    @all_bookings = policy_scope(Booking).where(user: current_user)
    @current_bookings = @all_bookings.select { |booking| booking.end_date > Date.today }
    @past_bookings = @all_bookings.select { |booking| booking.end_date < Date.today }
  end
end
