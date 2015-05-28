class Api::SongsController < ApplicationController
  def index
    puts "CURRENT TIME #{Time.now}"
    @page = params[:page]
    if params[:query]
      self.search
    elsif params[:find]
      self.find
    elsif params[:content] == 'favorites'
      self.favorites
    elsif params[:content] == 'feed'
      self.feed
    elsif params[:content] == 'added_songs'
      self.added_songs
    end
  end

  def search
    @songs = Song.includes(:blog, :band, :user, :tags, :favoriters)
      .search_by_title_or_band(params[:query])
        .page(params[:page])
    if @songs.empty?
      render json: @songs, status: 422
    else
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
        count = Song.joins(:user_songs)
          .where(user_songs: {created_at: time_range}).distinct.count('songs.id')
      end
      @songs = Song.includes(:blog, :band, :user, :tags, :favoriters)
        .joins(:user_songs).where(:user_songs => {:created_at => time_range})
          .group('songs.id').order('COUNT(user_songs.id) desc, songs.id')
            .page(params[:page]).per(7)
    elsif params[:find] == 'popular_all_time'
      @songs = Song.includes(:blog, :band, :user, :tags, :favoriters)
      .joins(:user_songs).group('songs.id')
        .order('COUNT(user_songs.id) desc, songs.id').page(params[:page]).per(7)
    else
      @songs = Song.includes(:blog, :band, :user, :tags, :favoriters)
        .order('created_at desc').limit(50).page(params[:page]).per(7)
    end
    render :search
  end

  def favorites
    #get the user and use the through association to get the songs
    #minimal time added to query is mitigated by pagination
    @user = User.includes(
      favorite_songs: [:blog, :band, :favoriters, :user, :tags]
    ).find(params[:user_id])
    render :favorites
  end

  def feed
    #get the user and use the through association to get the songs
    #minimal time added to query is mitigated by pagination
    @user = User.includes(
      followed_blog_songs: [:blog, :band, :favoriters, :tags, :user],
      followed_user_songs: [:blog, :band, :favoriters, :tags, :user]
    ).find(params[:user_id])
    render :feed
  end

  def added_songs
    #get the user and use the through association to get the songs
    #minimal time added to query is mitigated by pagination
    @user = User.includes(
      songs: [:blog, :band, :favoriters, :tags, :user]
    ).find(params[:user_id])
    render :added_songs
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
    params.require(:song).permit(
      :name,
      :band_name,
      :blog_id,
      :song_type,
      :audio,
      :audio_url,
      :image,
      :image_url,
      :genres,
      tag_ids: []
    )
  end
end
