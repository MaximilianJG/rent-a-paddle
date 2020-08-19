class BookingsController < ApplicationController

  def index
    @bookings_of_user = policy_scope(Boat).where(:user == current_user)
  end

  def new
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new(strong_booking_params)
    @booking.user = current_user
    @booking.boat = @boat
    authorize @booking

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render.new
    end


  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking

  end

  def edit
  end

  def strong_booking_params
    params.require(:booking).permit(:starting_date_time, :ending_date_time)

  end

end
