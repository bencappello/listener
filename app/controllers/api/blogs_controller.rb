class BlogsController < ApplicationController
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

    if @blog.save
      flash[:notice] = "#{@blog.name} added successfully"
      redirect_to blog_url(@blog.id)
    else
      flash.now[:errors] = @blog.errors.full_messages
      render :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
    render :show
  end

  def edit
    @blog = Blog.find(params[:id])
    render :edit
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      flash[:notice] = "#{@blog.name} added successfully"
      redirect_to blog_url(@blog.id)
    else
      flash.now[:errors] = @blog.errors.full_messages
      render :edit
    end
  end

  def destroy
    Blog.find(params[:id]).destroy
    redirect_to blogs_url
  end


  private

  def blog_params
    params.require(:blog).permit(:name, :url, tag_ids: [])
  end
end
