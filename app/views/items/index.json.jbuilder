json.array!(@items) do |item|
  json.extract! item, :name, :text, :price, :sale
  json.url item_url(item, format: :json)
end
