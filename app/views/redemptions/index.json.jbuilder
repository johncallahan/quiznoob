json.array!(@redemptions) do |redemption|
  json.extract! redemption, :id, :user_id, :reward_id, :hearts
  json.url redemption_url(redemption, format: :json)
end
