class Api::UserSongsController < ApplicationController
  # before_action :require_login

  def create
    @user_song = current_user.user_songs.new(user_song_params)
    @user_song.save
    redirect_to :back
  end

  def destroy
    song = params[:id]
    favoriter = current_user.id
    UserSong.find_by(user_id: favoriter, song_id: song).destroy
    flash[:notice] = ["Yeah fuck that song...."]
    redirect_to :back
  end

  private

  def user_song_params
    {song_id: params[:song_id].to_i}
  end
end
