json.extract! song, :id, :name, :user_id, :band_id, :blog_id, :song_type, :created_at, :updated_at
json.audio_url asset_path(song.audio.url)
json.list_image_url asset_path(song.image.url(:list))
json.nav_image_url asset_path(song.image.url(:nav))


json.creator_name song.user.username
json.blog_name song.blog.name
json.band_name song.band.name

json.tag_names song.tags.pluck('name')

json.favoriters_count song.favoriters.length
