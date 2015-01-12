json.extract! @song, :id, :name, :band_id, :blog_id, :song_type, :tag_ids, :created_at, :updated_at

json.blog_name @song.blog.name
json.blog_url @song.blog.url
json.band_name @song.band.name

json.tags @song.tags do |tag|
  json.extract! tag, :id, :name, :created_at, :updated_at
end

json.comments @song.comments do |comment|
  json.extract! comment, :id, :body, :user_id, :created_at, :updated_at

  json.author_name comment.author.username
end
