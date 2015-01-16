class Api::SongsController < ApplicationController
  def index
    if params[:query]
      @songs = Song.includes(:blog, :band).search_by_title_or_band(params[:query])
      if @songs.empty?
        render json: @songs, status: 422
      else
        render :search
      end
    else
      @songs = Song.all
      render :index
    end
  end

  def new
    @song = Song.new
    @blog_id = params[:blog_id] ? params[:blog_id] : nil
    @band_id = params[:band_id] ? params[:band_id] : nil
    render :new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      render :show
    else
      render json: @song.errors.full_messages, status: 422
    end
  end

  def show
    @song = Song.includes(:tags, :blog, :band, :favoriters, comments: :author).find(params[:id])
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
    params.require(:song).permit(:name, :band_id, :blog_id, :song_type, :audio, :audio_url, :image, :image_url, tag_ids: [])
  end
end
