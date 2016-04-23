json.array!(@gaming_objects) do |gaming_object|
  json.extract! gaming_object, :id, :name, :description, :type
  json.url gaming_object_url(gaming_object, format: :json)
end
