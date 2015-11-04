class NewFormula
  include Interactor

  def call
    ProductionFormula.transaction do
      context.production_formula = build_formula
      context.production_formula.save!
      create_formula_items
    end
    context.message = 'Production formula was successfully created.'
  end

  protected

  def build_formula
    ProductionFormula.new(production_formula_params)
  end

  def production_formula_params
    { tonnage: 0 }.merge(context.to_h.slice(:master_formula_id, :production_schedule_id, :tonnage))
  end

  def create_formula_items
    @formula_items = ItemMaster.where(master_formula_id: context.master_formula_id, active: 1)

    @formula_items.each do |item|
      NewItem.call({ production_formula_id: context.production_formula.id, \
                     item_master_id:        item.id, \
                     quantity:              0,
                     total_week: context.total_week.to_f })
    end
  end
end
