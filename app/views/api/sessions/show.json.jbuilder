json.(@user, :id, :username, :email, :created_at, :updated_at)
json.nav_image_url asset_path(@user.image.url(:nav))

json.favorite_songs @user.favorite_songs do |song|
  json.extract! song, :id
end

json.followed_blogs @user.followed_blogs do |blog|
  json.extract! blog, :id
end

json.followed_users @user.followed_users do |followed_user|
  json.extract! followed_user, :id, :username
end

json.followers @user.followers do |follower|
  json.extract! follower, :id, :username
end

json.blogs @user.blogs do |blog|
  json.extract! blog, :id, :name
end
