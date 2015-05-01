blog_songs = @user.followed_blog_songs.order('created_at desc').page(@page).per(6)
users_songs = @user.followed_user_songs.order('created_at desc').page(@page).per(4)
all_songs = (blog_songs + users_songs).sort_by(&:created_at).reverse

json.blog_songs blog_songs do |song|
  json.extract! song, :name
end
json.users_songs users_songs do |song|
  json.extract! song, :name
end
json.all_songs all_songs do |song|
  json.extract! song, :name
end

json.models all_songs do |feed_song|
  json.partial! "api/songs/list_show", song: feed_song
end

json.page_number @page
#when the one with fewer pages passes its total_pages limit it will
#return an empty array
json.total_pages [blog_songs.total_pages, users_songs.total_pages].max
