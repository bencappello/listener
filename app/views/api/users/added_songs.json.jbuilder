json.songs @user.songs.order('created_at desc') do |song|
  json.partial! "api/songs/list_show", song: song
end
