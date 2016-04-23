json.array!(@maps) do |map|
  json.extract! map, :id, :name, :description, :image_path
  json.url map_url(map, format: :json)
end
