class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
    @location = Location.all
  end

  def contact
  end

  def courses
    @courses = Course.all
  end
end
