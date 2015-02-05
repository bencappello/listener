json.(user, :id, :username, :email, :created_at, :updated_at)
json.profile_image_url asset_path(user.image.url(:profile))
json.nav_image_url asset_path(user.image.url(:nav))


json.songs user.songs do |song|
  json.partial! "api/songs/list_show", song: song
end

json.blogs user.blogs do |blog|
  json.partial! "api/blogs/list_show", blog: blog
end

json.favorite_songs user.favorite_songs do |favorite_song|
  json.partial! "api/songs/list_show", song: favorite_song
end

json.followed_blogs user.followed_blogs do |followed_blog|
  json.partial! "api/blogs/list_show", blog: followed_blog
end

json.followed_users user.followed_users do |followed_user|
  json.extract! followed_user, :id, :username
end

json.followers user.followers do |follower|
  json.extract! follower, :id, :username
end

songs = user.followed_blogs.map(&:songs).flatten
json.feed_songs do
  json.array!(songs) do |feed_song|
    json.partial! "api/songs/list_show", song: feed_song
  end
end
