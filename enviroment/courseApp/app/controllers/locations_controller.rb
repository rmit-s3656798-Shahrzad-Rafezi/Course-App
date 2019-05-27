class LocationsController < ApplicationController

  def show
    @locations = Location.find(params[:id])
  end

  def new
    @locations = Location.new
  end

  def all_courses
    @locations = Location.find(params[:id])
    @courses = @locations.courses.all
  end

  def create
    @locations = Location.new(location_params)
    if @locations.save
      flash[:success] = "A Location has been added!"
      redirect_to @locations

    else
      render 'new'
    end
  end

  private

  def location_params
    params.require(:location).permit(:name)
  end

end
