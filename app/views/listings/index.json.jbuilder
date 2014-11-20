json.array!(@listings) do |listing|
  json.extract! listing, :id, :name, :author, :price, :condition, :course
  json.url listing_url(listing, format: :json)
end
