json.(user, :id, :username, :email, :created_at, :updated_at)

json.favorite_songs user.favorite_songs do |favorite_song|
  json.extract! favorite_song, :id, :name, :band_id, :blog_id, :song_type, :created_at, :updated_at

  json.blog_name favorite_song.blog.name
  json.blog_url favorite_song.blog.url
  json.band_name favorite_song.band.name
end

json.followed_blogs user.followed_blogs do |followed_blog|
  json.extract! followed_blogs, :id, :name, :created_at, :updated_at
end

json.followed_users user.followed_users do |followed_user|
  json.extract! followed_user, :id, :username
end

json.followers user.followers do |follower|
  json.extract! follower, :id, :username
end
