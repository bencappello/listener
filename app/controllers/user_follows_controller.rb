class UserFollowsController < ApplicationController
  def create
    @user_follow = UserFollow.new()
    @user_follow.follower_id = current_user.id
    @user_follow.followed_user_id = params[:followed_user_id]

    if @user_follow.save
      flash[:notice] = ["Following user"]
    else
      flash[:errors] = @user_follow.errors.full_messages
    end
    redirect_to :back
  end

  def destroy
    followed = params[:id]
    follower = current_user.id
    UserFollow.find_by(followed_user_id: followed, follower_id: follower).destroy
    flash[:notice] = ["Yeah fuck that Ho's taste in music...."]
    redirect_to :back
  end

  private

  # def user_follow_params
  #   params.require(:user_follow).permit(:follower_id, :followed_user_id)
  # end
end
