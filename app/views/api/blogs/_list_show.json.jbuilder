json.extract! blog, :id, :name, :user_id, :created_at, :updated_at

json.creator_name blog.user.username
json.song_count blog.songs.count
json.tag_names blog.tags.pluck('name')
