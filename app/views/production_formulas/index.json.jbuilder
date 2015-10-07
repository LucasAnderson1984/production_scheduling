json.array!(@production_formulas) do |production_formula|
  json.extract! production_formula, :id, :master_formula_id, :production_schedule_id, :tonnage
  json.url production_formula_url(production_formula, format: :json)
end
