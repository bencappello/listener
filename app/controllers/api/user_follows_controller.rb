class Api::UserFollowsController < ApplicationController
  # before_action :require_login

  def create
    @user_follow = current_user.follow_choices.new(user_follow_params)

    if @user_follow.save
      render json: @user_follow
    else
      render json: @user_follow.errors.full_messages, status: 422
    end
  end

  def destroy
    followed = params[:id]
    follower = current_user.id
    UserFollow.find_by(followed_user_id: followed, follower_id: follower).destroy
    render json: followed
  end

  private

  def user_follow_params
    {followed_user_id: params[:followed_user_id].to_i}
  end
end
