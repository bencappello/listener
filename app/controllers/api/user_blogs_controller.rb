class Api::UserBlogsController < ApplicationController
  # before_action :require_login

  def create
    new_params = {user_id: current_user.id, blog_id: params[:blog_id]}
    user_blog = UserBlog.find_by(new_params)
    if user_blog
      user_blog.destroy
      render json: true
    else
      UserBlog.new(new_params).save
      render json: false
    end
  end
end
