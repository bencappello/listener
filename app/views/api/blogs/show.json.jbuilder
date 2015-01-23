json.extract!(@blog, :id, :name, :user_id, :tag_ids, :created_at, :updated_at)

json.user_name @blog.user.username

json.songs @blog.songs do |song|
  json.partial! "api/songs/list_show", song: song
end

json.tags @blog.tags do |tag|
  json.extract! tag, :id, :name, :created_at, :updated_at
end

json.comments @blog.comments do |comment|
  json.partial! "api/comments/show", comment: comment
end
