class CoursesController < ApplicationController

  def show
    @courses = Course.find(params[:id])
  end

  def new
    @courses = Course.new
    @categories = Category.all
    @location = Location.all
  end

  def create
    @categories = Category.all
    @location = Location.all
    @courses = Course.new(course_params)
    if @courses.save
      flash[:success] = "You have added a course!"
      redirect_to @courses
    else
      render 'new'
    end
  end

  private 

  def course_params
    params.require(:course).permit(:name, :prerequisite, :description)
  end

end
