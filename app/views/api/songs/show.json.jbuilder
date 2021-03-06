json.extract! @song, :id, :name, :user_id, :band_id, :blog_id, :song_type, :tag_ids, :created_at, :updated_at
json.audio_url asset_path(@song.audio.url)
json.large_image_url asset_path(@song.image.url(:large))
json.nav_image_url asset_path(@song.image.url(:nav))


json.creator_name @song.user.username
json.blog_name @song.blog.name
json.band_name @song.band.name

json.tags @song.tags do |tag|
  json.extract! tag, :id, :name, :created_at, :updated_at
end

json.comments @song.comments do |comment|
  json.partial! "api/comments/show", comment: comment
end

json.favoriters_count @song.favoriters.length
