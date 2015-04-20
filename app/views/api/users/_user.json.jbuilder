json.(user, :id, :username, :email, :created_at, :updated_at)
# json.profile_image_url asset_path(user.image.url(:profile))
json.nav_image_url asset_path(user.image.url(:nav))

json.favorite_songs user.favorite_songs

json.followed_blogs user.followed_blogs

json.followed_users user.followed_users

json.followers user.followers


# json.songs user.songs.order('created_at desc') do |song|
#   json.partial! "api/songs/list_show", song: song
# end

# json.blogs user.blogs.order('created_at desc') do |blog|
#   json.partial! "api/blogs/list_show", blog: blog
# end

# blog_songs = user.followed_blogs.map(&:songs).flatten
# users_songs = user.followed_users.map(&:favorite_songs).flatten
# all_songs = blog_songs + users_songs
# json.feed_songs do
#   json.array!(all_songs) do |feed_song|
#     json.partial! "api/songs/list_show", song: feed_song
#   end
# end
