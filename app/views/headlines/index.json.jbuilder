json.array!(@headlines) do |headline|
  json.extract! headline, 
  json.url headline_url(headline, format: :json)
end