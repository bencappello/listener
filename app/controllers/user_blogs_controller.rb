class UserBlogsController < ApplicationController
  before_action :require_login

  def create
    @user_blog = UserBlog.new()
    @user_blog.user_id = current_user.id
    @user_blog.blog_id = params[:blog_id]
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

  # def user_follow_params
  #   params.require(:user_blog).permit(:follower_id, :followed_user_id)
  # end
end
