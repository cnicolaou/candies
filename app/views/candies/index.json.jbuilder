json.array!(@candies) do |candy|
  json.extract! candy, :id, :candy_type
  json.url candy_url(candy, format: :json)
end
