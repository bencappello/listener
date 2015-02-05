json.extract!(@band, :id, :name, :created_at, :updated_at)

json.songs @band.songs do |song|
  json.partial! "api/songs/list_show", song: song
end

json.comments @band.comments do |comment|
  json.partial! "api/comments/show", comment: comment
end
