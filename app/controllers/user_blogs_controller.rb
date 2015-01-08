class UserBlogsController < ApplicationController
  before_action :require_login

  def create
    @user_blog = current_user.user_blogs.new(user_blog_params)
    @user_blog.save
    redirect_to :back
  end

  def destroy
    blog = params[:id]
    follower = current_user.id
    UserBlog.find_by(user_id: follower, blog_id: blog).destroy
    flash[:notice] = ["Yeah fuck that blog...."]
    redirect_to :back
  end

  private

  def user_blog_params
    {blog_id: params[:blog_id].to_i}
  end
end
