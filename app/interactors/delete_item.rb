class DeleteItem
  include Interactor

  def call
    ProductionItem.transaction do
      subtract_formula_tonnage
      destroy_item
    end
  end

  protected

  def item
    @item = ProductionItem.find(context.id)
  end

  def destroy_item
    item.destroy
  end

  def subtract_formula_tonnage
    formula = ProductionFormula.find(item.production_formula_id)
    formula.tonnage -= item.tons.to_i
    formula.save!
  end
end
