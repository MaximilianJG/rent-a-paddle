class BoatsController < ApplicationController

  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  def index

    if params[:query].present?
      @boats = policy_scope(Boat).where("location ILIKE ?", "%#{params[:query]}%")
    else
      @boats = policy_scope(Boat).all
      # @boats = Boat.geocoded # geocoded # returns boats with coordinates
    end

    # @boats = policy_scope(Boat).all

    # @markers = @boats.map do |boat|
    #   {
    #     lat: boat.latitude,
    #     lng: boat.longitude,
    #     infoWindow: render_to_string(partial: "info_window", locals: { boat: boat })
    #   }

    # end
  end

  def new
    @boat = Boat.new
    authorize @boat
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    authorize @boat

    if @boat.save
      redirect_to boats_path
    else
      render :new
    end

  end

  def show

    # These lines are for the booking form
    @booking = Booking.new
    @boats = []
    @boats << @boat
    @markers = @boats.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { boat: boat })
      }

    end
    end


  def edit
  end

  def update
    if @boat.update(boat_params)
      redirect_to boat_path(@restaurant)
    else
      render :update
    end
  end

  def destroy
    @boat.destroy
    redirect_to boats_path
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :category, :price, :location, :description, photos: [])
  end

  def set_boat
    @boat = Boat.find(params[:id])
    authorize @boat
  end
end
