class VotesController < ApplicationController

  def upvote
    @course = Course.find(params[:id])
    @course.votes.create(user_id: current_user.id)
    @course.save
    flash[:success] = "Thanks for your vote"
    redirect_to(courses_path)
  end

  def downvote
    @course = Course.find(params[:id])
    @course.votes.create(user_id: current_user.id)
    @course.save
    flash[:success] = "Thanks for your vote"
    redirect_to(courses_path)
  end
  
  private

  def vote_params
    params.require(:vote).permit(:user_id, :course_id, :type)
  end

end
