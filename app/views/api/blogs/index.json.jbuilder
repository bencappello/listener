json.array!(@blogs) do |blog|
  json.extract!(blog, :id, :name, :created_at, :updated_at)
end
