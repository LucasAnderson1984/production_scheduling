class NewFormula
  include Interactor

  before :check_new_formula_details

  def call
    ProductionFormula.transaction do
      context.production_formula = build_formula
      context.production_formula.save!
    end
  end

  protected

  def build_formula
    ProductionFormula.new(production_formula_params)
  end

  def production_formula_params
    { tonnage: tons }.merge(context.to_h.slice(:master_formula_id, :production_schedule_id, :tonnage))
  end

  def tons
    context.total_week.to_i * 2
  end

  def check_new_formula_details
    return if context.master_formula_id.present? && \
              context.production_schedule_id.present? && \
              context.total_week.present? && \
              is_int?(context.master_formula_id) && \
              is_int?(context.production_schedule_id)

    context.fail!(message: 'Invalid Entry')
  end

  def is_int? string
    true if Integer(string) rescue false
  end

  def is_dec? string
    true if Float(string) rescue false
  end
end
