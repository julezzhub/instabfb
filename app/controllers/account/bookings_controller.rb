class Account::BookingsController < ApplicationController

  def policy_scope(scope)
    super([:account, scope])
  end

  def index
    @all_bookings = policy_scope(Booking).where(user: current_user)
    @current_bookings = @all_bookings.select { |booking| booking.end_date > Date.today }
    @past_bookings = @all_bookings.select { |booking| booking.end_date < Date.today }
  end

  def pending
    @bookings = policy_scope(Booking) # anytime there is the possibilty of the return being nil or there being the wrong return use scope!!
    # if user.admin?
    # user == scope.all
    authorize @bookings
  end
end
