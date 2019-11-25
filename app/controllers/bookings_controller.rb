class BookingsController < ApplicationController
  before_action :set_boyfriend, only: %i[new create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.boyfriend = @boyfriend
    @booking.user = current_user
    if @booking.save
      redirect_to boyfriend_path(@boyfriend)
    else
      render :new
    end
  end

  private

  def set_boyfriend
    @boyfriend = Boyfriend.find(params[:boyfriend_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
