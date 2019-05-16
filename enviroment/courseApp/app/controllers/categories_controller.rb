class CategoriesController < ApplicationController

  def show
    @categories = Category.find(params[:id])
  end

  def new
    @categories = Category.new
  end

  def create
    @categories = Category.new(course_params)
      render 'new'
  end
end
