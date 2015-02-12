class Api::UsersController < ApplicationController

  PROFILE_PICS = [
    "http://s3.amazonaws.com/listener-dev/users/images/000/000/002/profile/slash.jpg?1423256793",
    "http://s3.amazonaws.com/listener-dev/users/images/000/000/003/profile/Pink-Floyd-006.jpg?1423256797",
    "http://s3.amazonaws.com/listener-dev/users/images/000/000/004/profile/The_Strokes__1__by_alexjames01.png?1423256798",
    "http://s3.amazonaws.com/listener-dev/users/images/000/000/005/profile/lou-reed-2.jpg?1423256800",
    "http://s3.amazonaws.com/listener-dev/users/images/000/000/006/profile/article-2178781-00558A751000044C-896_306x423.jpg?1423256801",
    "http://s3.amazonaws.com/listener-dev/users/images/000/000/007/profile/Rolling-Stones-Wallpaper-classic-rock-17732124-1024-768.jpg?1423256802",
    "http://s3.amazonaws.com/listener-dev/users/images/000/000/008/profile/Frank_Ocean_01-e1305847591792.jpeg?1423256803",
    "http://s3.amazonaws.com/listener-dev/users/images/000/000/009/profile/earl-sweatshirt.jpg?1423256804",
    "http://s3.amazonaws.com/listener-dev/users/images/000/000/010/profile/DEVENDRA-BANHART-32.jpg?1423256808",
    "http://s3.amazonaws.com/listener-dev/users/images/000/000/011/profile/21021209-37385753.jpg?1423256814"
  ]

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.includes(
      :followed_users,
      :followers,
      songs: [:blog, :band, :favoriters],
      blogs: [:tags, :songs],
      followed_blogs: [:tags, :songs],
      favorite_songs: [:blog, :band, :favoriters, :user]
      ).find(params[:id])
    render :show
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
        password: 'password',
        image_url: PROFILE_PICS.sample
      )

      @user.save

      30.times do
        UserSong.create(
          user_id: @user.id,
          song_id: Song.all.sample.id,
          created_at: Time.now - rand(48).hour
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
