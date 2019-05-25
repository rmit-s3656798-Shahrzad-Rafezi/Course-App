class CoursesController < ApplicationController

  def show
    @courses = Course.find(params[:id])
  end

  def index
    if params[:location]
      location = Location.find(params[:location]) || nil
      @courses = location.courses
    elsif params[:category]
      category = Category.find(params[:category])
      @courses = category.courses
    else
    @courses = Course.all
    @user = User.all
    end
  end

  def new
    @courses = Course.new
  end

  def create
    @courses = current_user.courses.new(course_params)

    if @courses.save
      flash[:success] = "You have added a course!"
      redirect_to @courses
    else
      render 'new'
    end
  end

  def edit
    @courses = Course.find(params[:id])
  end

  def update
    @courses = Course.find(params[:id])

    if @courses.update_attributes(course_params)
      flash[:success] = "Course updated"
      redirect_to @courses
    else
      render 'edit'
    end
  end

  private

  def course_params
    params.require(:course).permit(:user_id, :name, :prerequisite, :description, :image, {location_ids: []}, {category_ids: []})
  end

end
