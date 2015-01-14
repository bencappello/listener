class Api::UserFollowsController < ApplicationController
  # before_action :require_login

  def create
    new_params = {follower_id: current_user.id, followed_user_id: params[:followed_id]}
    user_follow = UserFollow.find_by(new_params)
    if user_follow
      user_follow.destroy
      render json: true
    else
      UserFollow.new(new_params).save
      render json: false
    end
  end
end
