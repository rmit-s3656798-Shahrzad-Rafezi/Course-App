class CoursesController < ApplicationController

  def show
    @courses = Course.find(params[:id])
  end

  def new
    @courses = Course.new
  end

  def create
    @courses = Course.new(course_params)
      render 'new'
  end

  private 

  def course_params
    params.require(:course).permit(:name, :prerequisite, :category)
  end

end
