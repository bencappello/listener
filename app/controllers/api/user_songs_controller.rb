class Api::UserSongsController < ApplicationController
  # before_action :require_login

  def create
    @user_song = current_user.user_songs.new(user_song_params)
    if @user_song.save
      render json: @user_song
    else
      render json: @user_song.errors.full_messages, status: 422
    end
  end

  def destroy
    song_id = params[:id]
    favoriter = current_user.id
    UserSong.find_by(user_id: favoriter, song_id: song_id).destroy
    render json: song_id
  end

  private

  def user_song_params
    {song_id: params[:song_id]}
  end
end
