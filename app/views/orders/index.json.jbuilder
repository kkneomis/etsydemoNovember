json.array!(@orders) do |order|
  json.extract! order, :id, :detail
  json.url order_url(order, format: :json)
end
