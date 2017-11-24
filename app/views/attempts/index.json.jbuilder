json.array!(@attempts) do |attempt|
  json.extract! attempt, :id, :user_id, :quiz_id
  json.url attempt_url(attempt, format: :json)
end
