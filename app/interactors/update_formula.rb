class UpdateFormula
  include Interactor

  def call
    ProductionFormula.transaction do
      tonnage
    end
    context.message = 'Production formula was successfully updated.'
  end

  def tonnage
    production_formula = ProductionFormula.find(context.production_formula_id)
    production_formula.tonnage = production_formula.components.round.to_i
    production_formula.save!
  end
end
