returned_songs = @user.favorite_songs.order('user_songs.created_at desc').page(@page)

# json.favorite_songs do
#   json.models returned_songs do |favorite_song|
#     json.partial! "api/songs/list_show", song: favorite_song
#   end
#
#   json.page_number @page
#   json.total_pages returned_songs.total_pages
# end


json.models returned_songs do |favorite_song|
  json.partial! "api/songs/list_show", song: favorite_song
end

json.page_number @page
json.total_pages returned_songs.total_pages
