class Api::SongsController < ApplicationController
  def index
    if params[:query]
      self.search
    elsif params[:find]
      self.find
    elsif params[:content] = 'favorites'
      self.favorites
    end
  end

  def search
    @songs = Song.includes(:blog, :band, :user)
      .search_by_title_or_band(params[:query])
        .page(params[:page])
    if @songs.empty?
      render json: @songs, status: 422
    else
      @page = params[:page]
      render :search
    end
  end

  def find
    if params[:find] == 'popular_now'
      time = 2
      count = 0
      while count < 5
        time += 1
        time_range = (Time.now - time.day)..Time.now
        count = Song.joins(:user_songs).where(:user_songs => {:created_at => time_range}).distinct.count('songs.id')
      end
      @songs = Song.includes(:blog, :band, :user).joins(:user_songs)
        .where(:user_songs => {:created_at => time_range})
          .group('songs.id').order('COUNT(user_songs.id) desc, songs.id')
            .page(params[:page])
    elsif params[:find] == 'popular_all_time'
      @songs = Song.includes(:blog, :band, :user).joins(:user_songs)
        .group('songs.id').order('COUNT(user_songs.id) desc, songs.id')
          .page(params[:page])
    else
      @songs = Song.includes(:blog, :band, :user).order('created_at desc')
        .limit(50).page(params[:page])
    end
    @page = params[:page]
    render :search
  end

  def favorites
    #get the user as opposed to just the songs because its simpler to
    #use the through association to get the songs
    @page = params[:page]
    @user = User.includes(
      favorite_songs: [:blog, :band, :favoriters, :user]
    ).find(params[:user_id])
    render :favorites
  end

  def new
    @song = Song.new
    @blog_id = params[:blog_id] ? params[:blog_id] : nil
    @band_id = params[:band_id] ? params[:band_id] : nil
    render :new
  end

  def create
    @song = Song.new(song_params)
    @song.user_id = current_user.id

    if @song.save
      render :show
    else
      render json: @song.errors.full_messages, status: 422
    end
  end

  def show
    @song = Song.includes(
      :user,
      :tags,
      :blog,
      :band,
      :favoriters,
      comments: :author
      ).find(params[:id])
    render :show
  end

  def edit
    @song = Song.find(params[:id])
    render :edit
  end

  def update
    @song = Song.find(params[:id])

    if @song.update(song_params)
      render :show
    else
      render json: @song.errors.full_messages, status: 422
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_url
  end

  private

  def song_params
    params.require(:song).permit(:name, :band_name, :blog_id, :song_type, :audio, :audio_url, :image, :image_url, :genres, tag_ids: [])
  end
end
