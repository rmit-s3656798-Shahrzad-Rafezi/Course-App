class CoursesController < ApplicationController

  def show
    @courses = Course.find(params[:id])
  end

  def index
    @courses = Course.all
    @user = User.all
  end

  def new
    @courses = Course.new
    @categories = Category.all
    @location = Location.all
  end

  def create
    @courses = Course.new(course_params)
    @categories = Category.all
    @location = Location.all
    if @courses.save
      flash[:success] = "You have added a course!"
      redirect_to @courses
    else
      render 'new'
    end
  end

  def edit
    @courses = Course.find(params[:id])
    @categories = Category.all
    @location = Location.all
  end

  def update
    @courses = Course.find(params[:id])
    @categories = Category.all
    @location = Location.all
    if @courses.update_attributes(course_params)
      flash[:success] = "Course updated"
      redirect_to @courses
    else
      render 'edit'
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :prerequisite, :description, :image, location_id: [], category_id: [])
  end

end
