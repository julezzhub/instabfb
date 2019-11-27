class BookingsController < ApplicationController
  before_action :set_boyfriend, only: %i[create]

  def create
    @booking = Booking.new(booking_params)
    @booking.boyfriend = @boyfriend
    @booking.user = current_user
    if @booking.save
      redirect_to account_booking_path(current_user)
    else
      render 'boyfriends/show'
    end
  end

  def accept
    booking = Booking.find(params[:id])
    booking.update(status: true)

    redirect_to pending_account_bookings_path
    flash[:notice] = "Booking accepted - have a great shoot!"
  end

  def reject
    booking = Booking.find(params[:id])
    booking.update(status: false)

    redirect_to pending_account_bookings_path
    flash[:notice] = "Booking rejected"
  end

  private

  def set_boyfriend
    @boyfriend = Boyfriend.find(params[:boyfriend_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
