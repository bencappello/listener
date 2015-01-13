json.array!(@songs) do |song|
  json.extract!(song, :id, :name, :song_type, :created_at, :updated_at)
end
