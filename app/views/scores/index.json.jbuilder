json.array!(@scores) do |score|
  json.extract! score, :id, :user_id
  json.url score_url(score, format: :json)
end
