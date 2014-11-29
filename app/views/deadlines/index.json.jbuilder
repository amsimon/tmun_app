json.array!(@deadlines) do |deadline|
  json.extract! deadline, 
  json.url deadline_url(deadline, format: :json)
end