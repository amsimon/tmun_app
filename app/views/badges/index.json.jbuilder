json.array!(@badges) do |badge|
  json.extract! badge, 
  json.url badge_url(badge, format: :json)
end