class SongsController < ApplicationController
  def index
    @songs = Song.all
    render :index
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
      flash[:notice] = "#{@song.name} added successfully"
      redirect_to song_url(@song.id)
    else
      flash.now[:errors] = @song.errors.full_messages
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
    render :show
  end

  def edit
    @song = Song.find(params[:id])
    render :edit
  end

  def update
    @song = Song.find(params[:id])

    if @song.update(song_params)
      flash[:notice] = "#{@song.name} added successfully"
      redirect_to song_url(@song.id)
    else
      flash.now[:errors] = @song.errors.full_messages
      render :new
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_url
  end

  private

  def song_params
    params.require(:song).permit(:name, :band_id, :blog_id, :song_type, tag_ids: [])
  end
end
