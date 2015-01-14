class Api::UserSongsController < ApplicationController
  # before_action :require_login

  def create
    new_params = {user_id: current_user.id, song_id: params[:song_id]}
    user_song = UserSong.find_by(new_params)
    if user_song
      user_song.destroy
      render json: true
    else
      UserSong.new(new_params).save
      render json: false
    end
  end
end
