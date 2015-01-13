class Api::UserBlogsController < ApplicationController
  # before_action :require_login

  def create
    @user_blog = current_user.user_blogs.new(user_blog_params)
    if @user_blog.save
      render json: @user_blog
    else
      render json: @user_blog.errors.full_messages, status: 422
    end
  end

  def destroy
    blog_id = params[:id]
    follower = current_user.id
    UserBlog.find_by(user_id: follower, blog_id: blog_id).destroy
    render json: blog_id
  end

  private

  def user_blog_params
    {blog_id: params[:blog_id].to_i}
  end
end
