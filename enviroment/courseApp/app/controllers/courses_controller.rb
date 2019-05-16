class CoursesController < ApplicationController

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
      render 'new'
  end

  private 

  def course_params
    parparams.require(:course).permit(:name, :prerequisite, :category,
    :description)
  end
  
end
