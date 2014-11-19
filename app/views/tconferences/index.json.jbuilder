json.array!(@tconferences) do |tconference|
  json.extract! tconference, 
  json.url tconference_url(tconference, format: :json)
end