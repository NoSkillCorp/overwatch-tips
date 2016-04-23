json.array!(@characters) do |character|
  json.extract! character, :id, :name, :description, :image_path
  json.url character_url(character, format: :json)
end
