class UserFollowsController < ApplicationController
  def create
    @user_follow = UserFollow.new(user_follow_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:notice] = ["Comment saved!"]
    else
      flash[:errors] = @comment.errors.full_messages
    end
    redirect_to :back
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(user_follow_params)
      flash[:notice] = ["Comment saved!"]
    else
      flash[:errors] = @comment.errors.full_messages
    end
    redirect_to :back
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def user_follow_params
    params.require(:user_follow).permit(:follower_id, :followed_user_id)
  end
end
