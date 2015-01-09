json.array!(@bands) do |band|
  json.extract!(band, :id, :name, :created_at, :updated_at)
end
