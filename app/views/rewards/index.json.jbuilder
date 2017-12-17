json.array!(@rewards) do |reward|
  json.extract! reward, :id, :name, :description, :hearts
  json.url reward_url(reward, format: :json)
end
