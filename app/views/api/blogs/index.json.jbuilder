json.array!(@blogs) do |blog|
  json.extract!(blog, :id, :name, :url, :created_at, :updated_at)
end
