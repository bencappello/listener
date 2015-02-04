class Api::BlogsController < ApplicationController
  def index
    @blogs = Blog.all
    render :index
  end

  def new
    @blog = Blog.new
    render :new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id

    if @blog.save
      render :show
    else
      render json: @blog.errors.full_messages, status: 422
    end
  end

  def show
    @blog = Blog.includes(
      :user,
      :tags,
      songs: [:blog, :band, :favoriters],
      comments: :author
      ).find(params[:id])
    render :show
  end

  def edit
    @blog = Blog.find(params[:id])
    render :edit
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update(blog_params)
      render :show
    else
      render json: @blog.errors.full_messages, status: 422
    end
  end

  def destroy
    Blog.find(params[:id]).destroy
    redirect_to blogs_url
  end


  private

  def blog_params
    params.require(:blog).permit(:name, tag_ids: [])
  end
end
