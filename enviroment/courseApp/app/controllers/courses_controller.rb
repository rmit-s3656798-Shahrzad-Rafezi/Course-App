class CoursesController < ApplicationController

  def show
    @courses = Course.all
  end

  def new
    @courses = Course.new
    @categories = Category.all
    @location = Location.all
  end

  def create
    @courses = Course.new(course_params)
      render 'new'
  end

  private 

  def course_params
    params.require(:course).permit(:name, :prerequisite, :description)
  end

end
