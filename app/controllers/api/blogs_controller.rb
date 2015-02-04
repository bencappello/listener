class Api::BlogsController < ApplicationController
  def index
    if params[:find] == 'popular_now'
      time = 0
      count = 0
      while count < 5
        time += 3
        time_range = (Time.now - time.day)..Time.now
        count = Blog.joins(:user_blogs).where(:user_blogs => {:created_at => time_range}).distinct.count('blogs.id')
      end
      @blogs = Blog.includes(:songs, :tags, :user).joins(:user_blogs)
        .where(:user_blogs => {:created_at => time_range})
          .group('blogs.id').order('COUNT(user_blogs.id) desc, blogs.id')
            .page(params[:page])
    elsif params[:find] == 'popular_all_time'
      @blogs = Blog.includes(:songs, :tags, :user).joins(:user_blogs)
        .group('blogs.id').order('COUNT(user_blogs.id) desc, blogs.id')
          .page(params[:page])
    else
      @blogs = Blog.includes(:songs, :tags, :user).order('created_at desc')
        .limit(50).page(params[:page])
    end
    @page = params[:page]
    render :find
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
      blogs: [:blog, :band, :favoriters],
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
