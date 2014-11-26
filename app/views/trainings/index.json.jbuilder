json.array!(@trainings) do |training|
  json.extract! training, 
  json.url training_url(training, format: :json)
end