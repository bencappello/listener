json.(@user, :id, :username, :email, :created_at, :updated_at)
json.profile_image_url asset_path(@user.image.url(:profile))
