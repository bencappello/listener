class UserSongsController < ApplicationController
  def create
    @user_song = UserSong.new()
    @user_song.user_id = current_user.id
    @user_song.song_id = params[:song_id]
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

  # def user_follow_params
  #   params.require(:user_song).permit(:follower_id, :followed_user_id)
  # end
end
