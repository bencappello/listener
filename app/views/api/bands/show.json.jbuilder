json.extract!(@band, :id, :name, :created_at, :updated_at)


json.songs @band.songs do |song|
  json.extract! song, :id, :name, :band_id, :blog_id, :song_type, :created_at, :updated_at

  json.blog_name song.blog.name
  json.blog_url song.blog.url
  json.band_name song.band.name
end

json.tags @band.tags do |tag|
  json.extract! tag, :id, :name, :created_at, :updated_at
end

json.comments @band.comments do |comment|
  json.extract! comment, :id, :body, :user_id, :created_at, :updated_at

  json.author_name comment.author.username
end
