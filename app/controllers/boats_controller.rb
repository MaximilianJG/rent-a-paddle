class BoatsController < ApplicationController


  def index
    @boats = Boat.all
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






end

private

def boat_params
  params.require(:boat).permit(:name, :type, :price, :location, :description)
end
