json.array!(@faqs) do |faq|
  json.extract! faq, 
  json.url faq_url(faq, format: :json)
end