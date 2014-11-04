json.array!(@votes) do |vote|
  json.extract! vote, :id, :party
  json.url vote_url(vote, format: :json)
end
