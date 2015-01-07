class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
    render :index
  end

  def new
    @blog = Blog.new
    @tag_ids = []
    render :new
  end

  def create
    @blog = Blog.new(blog_params)

    if params[:tag_ids] == [""]
      @tag_ids = params[:tag_ids]
      flash.now[:errors] = ["Must select a tag"]
      render :new
    elsif @blog.save
      @blog.update_tags(params[:tag_ids])
      flash[:notice] = "#{@blog.name} added successfully"
      redirect_to blog_url(@blog.id)
    else
      @tag_ids = params[:tag_ids]
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
    @tag_ids = @blog.tags.pluck(:id).map(&:to_s)
    render :edit
  end

  def update
    @blog = Blog.find(params[:id])
    if params[:tag_ids] == [""]
      @tag_ids = params[:tag_ids]
      flash.now[:errors] = ["Must select a tag"]
      render :edit
    elsif @blog.update(blog_params)
      @blog.update_tags(params[:tag_ids])
      flash[:notice] = "#{@blog.name} added successfully"
      redirect_to blog_url(@blog.id)
    else
      @tag_ids = params[:tag_ids]
      flash.now[:errors] = @blog.errors.full_messages
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_url
  end


  private

  def blog_params
    params.require(:blog).permit(:name, :url)
  end
end
