json.array!(@stocks) do |stock|
  json.extract! stock, :id, :bin_id, :feed_id, :glebe_id, :amount, :datestock, :datestart, :dateend
  json.url stock_url(stock, format: :json)
end
