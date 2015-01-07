class SongsController < ApplicationController
  def new
    @song = Song.new
    @blog_id = params[:blog_id] if params[:blog_id]
    @band_id = params[:band_id] if params[:band_id]
    render :new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
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
      redirect_to song_url(@song)
    else
      flash.now[:errors] = @song.errors.full_messages
      render :edit
    end
  end

  def destroy
    @song = Song.new(song_params)
    @song.destroy
  end

  private

  def song_params
    params.require(:song).permit(:name, :band_name, :blog_name, :song_type)
  end
end
