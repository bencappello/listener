json.array!(@songs) do |song|
  json.extract!(song, :id, :name, :created_at, :updated_at)
end
