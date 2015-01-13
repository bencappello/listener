json.extract! song, :id, :name, :band_id, :blog_id, :song_type, :created_at, :updated_at

json.blog_name song.blog.name
json.blog_url song.blog.url
json.band_name song.band.name
