class CoursesController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def show
    @courses = Course.find(params[:id])
  end

  def index
    @courses = Course.all
    @user = User.all
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

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

end
