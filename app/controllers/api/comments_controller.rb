class Api::CommentsController < ApplicationController

  before_action :require_login, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:notice] = ["Comment saved!"]
    else
      flash[:errors] = @comment.errors.full_messages
    end
    render :show
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
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

  def comment_params
    params.require(:comment).permit(:commentable_id, :commentable_type, :body)
  end
end
