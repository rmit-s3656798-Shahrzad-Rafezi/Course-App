class CategoriesController < ApplicationController

  def show
    @categories = Category.find(params[:id])
  end

  def new
    @categories = Category.new
  end

  def create
    @categories = Category.new(category_params)
    render 'new'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
