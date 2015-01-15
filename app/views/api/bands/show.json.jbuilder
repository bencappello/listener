json.extract!(@band, :id, :name, :tag_ids, :created_at, :updated_at)

json.songs @band.songs do |song|
  json.partial! "api/songs/list_show", song: song
end

json.tags @band.tags do |tag|
  json.extract! tag, :id, :name, :created_at, :updated_at
end

json.comments @band.comments do |comment|
  json.partial! "api/comments/show", comment: comment
end
