class UpdateFormula
  include Interactor

  def call
    ProductionFormula.transaction do
      context.production_formula = ProductionFormula.find(context.production_formula_id)
      context.production_formula.tonnage = context.production_formula.tons.round.to_i
      context.production_formula.save!
    end
    context.message = 'Production formula was successfully updated.'
  end
end
