json.(current_user, :id, :username, :email, :created_at, :updated_at)
json.nav_image_url asset_path(current_user.image.url(:nav))

json.favorite_songs current_user.favorite_songs do |song|
  json.extract! song, :id
end

json.followed_blogs current_user.followed_blogs do |blog|
  json.extract! blog, :id
end

json.followed_users current_user.followed_users do |followed_user|
  json.extract! followed_user, :id, :username
end

json.followers current_user.followers do |follower|
  json.extract! follower, :id, :username
end

json.blogs current_user.blogs do |blog|
  json.extract! blog, :id, :name
end
