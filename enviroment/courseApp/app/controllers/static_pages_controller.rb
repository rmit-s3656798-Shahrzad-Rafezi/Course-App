class StaticPagesController < ApplicationController
  def home
  end

  def contact
  end

  def courses
    @courses = Course.all
  end
end
