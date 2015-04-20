json.(user, :id, :username, :email, :created_at, :updated_at)
json.profile_image_url asset_path(user.image.url(:profile))
json.nav_image_url asset_path(user.image.url(:nav))

json.favorite_songs user.favorite_songs.order('user_songs.created_at desc') do |favorite_song|
  json.partial! "api/songs/list_show", song: favorite_song
end

json.followed_blogs user.followed_blogs.order('user_blogs.created_at desc') do |followed_blog|
  json.partial! "api/blogs/list_show", blog: followed_blog
end

json.followed_users user.followed_users do |followed_user|
  json.extract! followed_user, :id, :username
end

json.followers user.followers do |follower|
  json.extract! follower, :id, :username
end


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
