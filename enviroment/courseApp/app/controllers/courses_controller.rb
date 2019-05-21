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
      query == <<-SQL
        INSERT INTO categories (name), locations (name), users (name)
      SQL
      ActiveRecord::Base.connection.execute(query)
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
