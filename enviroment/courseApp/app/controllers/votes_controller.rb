class VotesController < ApplicationController

  def upvote
    @courses = Course.find(params[:id])
    @courses.votes.create
    flash[:success] = "Thanks for your vote"
    redirect_to(courses_path)
  end

  def downvote
    @courses = Course.find(params[:id])
    @courses.votes.create
    flash[:success] = "Thanks for your vote"
    redirect_to(courses_path)
  end
  
  private

  def vote_params
    params.require(:vote).permit(:user_id, :course_id, :type)
  end

end
