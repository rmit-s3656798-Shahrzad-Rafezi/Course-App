class VotesController < ApplicationController

  def upvote
    @courses = Course.find(params[:id])
    @courses.votes.create(@user)
    redirect_to(courses_path)
  end

  # should be implemented for the admin functionality, which they can reset votes.
  def downvote
  end    
  
end
