json.(@user, :id, :username, :email, :created_at, :updated_at)
json.nav_image_url asset_path(@user.image.url(:nav))

json.favorite_songs @user.favorite_songs

json.followed_blogs @user.followed_blogs

json.followed_users @user.followed_users

json.followers @user.followers
