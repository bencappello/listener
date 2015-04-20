json.favorite_songs @user.favorite_songs.order('user_songs.created_at desc') do |favorite_song|
  json.partial! "api/songs/list_show", song: favorite_song
end
