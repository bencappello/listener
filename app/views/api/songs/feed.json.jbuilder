blog_songs = @user.followed_blog_songs.order('created_at desc').page(@page).per(3)
users_songs = @user.followed_user_songs.order('created_at desc').page(@page).per(3)
all_songs = (blog_songs + users_songs).sort_by(&:created_at).reverse

json.models all_songs do |feed_song|
  json.partial! "api/songs/list_show", song: feed_song
end

json.page_number @page
#when the one with fewer pages passes its total_pages limit it will
#return an empty array
json.total_pages [blog_songs.total_pages, users_songs.total_pages].max
