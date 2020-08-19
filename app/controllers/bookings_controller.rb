class BookingsController < ApplicationController

  def index
    @booking = Booking.where(booking.user == current_user)
  end

  # def new
  # end

  def create
    @booking = Booking.new(strong_booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to booking_path
    else
      render.new
    end


  end

  def show
    @bookings = Booking.find(params[:id])

  end

  def edit
  end

  def strong_booking_params
    params.require(:boat).permit(:id)

  end

end
