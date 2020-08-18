class BoatsController < ApplicationController

  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  def index
    @boats = policy_scope(Boat).all
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
  end


  private

  def boat_params
    params.require(:boat).permit(:name, :type, :price, :location, :description)
  end

  def set_boat
    @boat = Boat.find(params[:id])
    authorize @boat
  end

end
