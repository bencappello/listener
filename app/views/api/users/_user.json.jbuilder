json.(user, :id, :username, :email, :created_at, :updated_at)
json.image_url asset_path(user.image.url)

json.favorite_songs user.favorite_songs do |favorite_song|
  json.partial! "api/songs/list_show", song: favorite_song
end

json.followed_blogs user.followed_blogs do |followed_blog|
  json.extract! followed_blog, :id, :name, :created_at, :updated_at

  json.song_count followed_blog.songs.count
  json.tag_names followed_blog.tags.pluck('name')
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
