class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
  end

  def contact
  end

  def courses
    @courses = Course.all
  end
end
