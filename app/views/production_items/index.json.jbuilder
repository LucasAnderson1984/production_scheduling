json.array!(@production_items) do |production_item|
  json.extract! production_item, :id, :production_formula_id, :item_master_id, :quantity
  json.url production_item_url(production_item, format: :json)
end
