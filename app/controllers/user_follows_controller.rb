class UserFollowsController < ApplicationController
  before_action :require_login

  def create
    @user_follow = current_user.follow_choices.new(user_follow_params)

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

  def user_follow_params
    {followed_user_id: params[:followed_user_id].to_i}
  end
end
