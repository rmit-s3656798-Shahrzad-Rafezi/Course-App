class LocationsController < ApplicationController

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = "A Location has been added!"
      redirect_to @location

    else
      render 'new'
    end
  end

  private

  def location_params
    params.require(:location).permit(:name)
  end

end
