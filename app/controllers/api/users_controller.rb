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

  ALBUM_PICS = [
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/019/list/f251d544.jpg?1423256921",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/007/list/artsy_splats_by_Maikey.jpg?1423256895",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/016/list/ii-art-artsy-beautiful-Favim.com-689826.jpg?1423256909",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/003/list/artsy-accidental-shotsmall.jpg?1423256823",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/013/list/Artsy-Apple2.jpg?1423256904",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/017/list/Young_Magic_LP_cover_flat.jpg?1423256911",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/010/list/photooftheday-iphone-gf-night-summer-newyork-buffalo-tunnel-light-blackandwhite-_mattbissett-Instagram.jpg?1423256900",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/021/list/artsy-guitar-by-kaki-king.jpg?1423256924",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/008/list/1461857-My-attempt-at-artsy-photography-0.jpg?1423256897",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/011/list/welcome-to-artsy-asheville-gray-artus.jpg?1423256901",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/001/list/Sunset-from-Artsy-HQ.jpg?1423256819",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/015/list/artsy-black-design-background-31000.jpg?1423256907",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/006/list/original.jpg?1423256894",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/018/list/The_Catalyst_4.75_single_DJ_Crossfire.JPEG?1423256913",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/014/list/11-29-13_252520koda_252520chrome_252520forest-AFF8_thumb_25255B2_25255D.jpg?1423256905",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/005/list/im-so-artsy-all-of-the-sudden-johnathan-dahl.jpg?1423256892",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/002/list/artsy_magenta_trees.jpg?1423256822",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/004/list/ARTSY.JPG?1423256824",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/020/list/recordseries-pressmarker.jpg?1423256923",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/009/list/tumblr_m4v2qcM0fL1ql5w50o1_500.jpg?1423256898",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/012/list/artsy-sunflower-sonya-chalmers.jpg?1423256903",
    "http://s3.amazonaws.com/listener-dev/songs/images/000/000/022/list/crystal_20antlers_album_20cover.jpg?1423256925"
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
    @user = User.create!(
      username: "guest#{rand(1000)}",
      email: Faker::Internet.email,
      password: 'password',
      image_url: PROFILE_PICS.sample
    )
    if @user.save
      sign_in!(@user)

      3.times do
        Blog.create(
          name: generate_name,
          user_id: @user.id,
          created_at: Time.now - rand(8).hour
        )
      end

      3.times do
        type = ['remix', 'regular'].sample
        blog_id = @user.blogs.sample.id
        band_id = Band.all.sample.id
        Song.create(
          name: generate_name,
          song_type: type,
          blog_id: blog_id,
          user_id: @user.id,
          band_id: band_id,
          image_url: ALBUM_PICS.sample,
          created_at: Time.now - rand(8).hour
        )
      end

      12.times do
        UserSong.create(
          user_id: @user.id,
          song_id: Song.all.sample.id,
          created_at: Time.now - rand(8).hour
        )
      end

      7.times do
        UserBlog.create(
          user_id: @user.id,
          blog_id: Blog.all.sample.id,
          created_at: Time.now - rand(8).hour
        )
      end

      render :show
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
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

  def generate_name
    phrase = TokenPhrase.generate(' ').split(' ')
    name = []
    name << phrase[0]
    name << phrase[3]
    name.join(' ')
  end

end
