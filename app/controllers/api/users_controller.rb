class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def show
    @page = params[:page]
    if params[:content] == 'favorites'
      @user = User.includes(
        favorite_songs: [:blog, :band, :favoriters, :user]
      ).find(params[:id])
      render :favorites
    elsif params[:content] == 'feed'
      @user = User.includes(
        followed_blogs: [songs: [:blog, :band, :favoriters]],
        followed_users: [favorite_songs: [:blog, :band, :favoriters]]
      ).find(params[:id])
      render :feed
    elsif params[:content] == 'added_songs'
      @user = User.includes(
        songs: [:blog, :band, :favoriters]
      ).find(params[:id])
      render :added_songs
    elsif params[:content] == 'added_blogs'
      @user = User.includes(
        blogs: [:tags, :songs]
      ).find(params[:id])
      render :added_blogs
    elsif params[:content] == 'followed_blogs'
      @user = User.includes(
        followed_blogs: [:tags, :songs]
      ).find(params[:id])
      render :followed_blogs
    else #just fetch info for sidepanel - username, avatar, etc.
      @user = User.find(params[:id])
      render :show
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in!(@user)
      render :show
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def create_new
    if current_user.username == 'thatpurplestuff'
      @user = User.create!(
        username: Faker::Name.name,
        email: Faker::Internet.email,
        password: 'password'
      )

      200.times do
        UserSong.create(
          user_id: @user.id,
          song_id: Song.all.sample.id,
          created_at: Time.now - rand(72).hour
        )
      end

      20.times do
        UserBlog.create(
          user_id: @user.id,
          blog_id: Blog.all.sample.id,
          created_at: Time.now - rand(48).hour
        )
      end

      render json: {username: @user.username}
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render :show
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  protected

  def user_params
    self.params.require(:user).permit(:username, :email, :password, :image, :image_url)
  end

end
