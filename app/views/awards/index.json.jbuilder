json.array!(@awards) do |award|
  json.extract! award, :id, :user_id, :hearts
  json.url award_url(award, format: :json)
end
