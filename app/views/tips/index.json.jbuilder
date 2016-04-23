json.array!(@tips) do |tip|
  json.extract! tip, :id, :description, :title
  json.url tip_url(tip, format: :json)
end
