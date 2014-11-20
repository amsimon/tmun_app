json.array!(@cconferences) do |cconference|
  json.extract! cconference, 
  json.url cconference_url(cconference, format: :json)
end