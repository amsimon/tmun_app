json.array!(@speakers) do |speaker|
  json.extract! speaker, :portrait_url, :name, :committee_name, :bio
  json.url speaker_url(speaker, format: :json)
end