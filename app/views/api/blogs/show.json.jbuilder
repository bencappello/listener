json.extract!(@blog, :id, :name, :url, :tag_ids, :created_at, :updated_at)


json.songs @blog.songs do |song|
  json.partial! "api/songs/list_show", song: song
end

json.tags @blog.tags do |tag|
  json.extract! tag, :id, :name, :created_at, :updated_at
end

json.comments @blog.comments do |comment|
  json.extract! comment, :id, :body, :user_id, :created_at, :updated_at

  json.author_name comment.author.username
end
