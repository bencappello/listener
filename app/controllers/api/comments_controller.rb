class Api::CommentsController < ApplicationController

  before_action :require_login, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    unless @comment.save
      render json: @comment.errors.full_messages
    end
    render :show
  end

  def update
    @comment = Comment.find(params[:id])
    unless @comment.update(comment_params)
      render json: @comment.errors.full_messages
    end
    render json: @comment
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:commentable_id, :commentable_type, :body)
  end
end
