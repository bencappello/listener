json.extract!(@band, :id, :name, :created_at, :updated_at)


json.songs @band.songs do |song|
  json.extract! song, :id, :name, :band_id, :blog_id, :song_type, :created_at, :updated_at
end
