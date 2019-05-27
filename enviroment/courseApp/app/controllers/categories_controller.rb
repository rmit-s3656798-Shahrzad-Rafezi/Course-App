class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @categories = Category.find(params[:id])
  end

  def new
    @categories = Category.new
  end

  def all_courses
    @categories = Category.find(params[:id])
    @courses = @categories.courses.all
  end

  def create
    @categories = Category.new(category_params)
    if @categories.save
      flash[:success] = "You have added a category!"
      redirect_to @categories
    else
      render 'new'
    end
  end

  def edit
    @categories = Category.find(params[:id])
  end

  def update
    @categories = Category.find(params[:id])
    if @categories.update_attributes(category_params)
      flash[:success] = "Category updated"
      redirect_to @categories
    else
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to root_url
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def super_user
    redirect_to(root_url) unless current_user.try(:superuser?)
  end

end
