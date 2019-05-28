class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

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

  def edit
    @locations = Location.find(params[:id])
  end

  def update
    @locations = Location.find(params[:id])
    if @locations.update_attributes(location_params)
      flash[:success] = "Location updated"
      redirect_to @locations
    else
      render 'edit'
    end
  end

  def destroy
    Location.find(params[:id]).destroy
    flash[:success] = "Location deleted"
    redirect_to root_url
  end

  private

  def location_params
    params.require(:location).permit(:name)
  end

  def super_user
    redirect_to(root_url) unless current_user.try(:superuser?)
  end

end
