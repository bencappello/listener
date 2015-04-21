returned_songs = @user.songs.order('created_at desc').page(@page)

json.models returned_songs do |song|
  json.partial! "api/songs/list_show", song: song
end

json.page_number @page
json.total_pages returned_songs.total_pages
