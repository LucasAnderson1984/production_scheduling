class WeeksSupplyCalcsController < ApplicationController
  helper_method :entry, :formula
  respond_to :html

  def create
    render :new and return unless entry.valid?

    handle_service_result(formula_create,
                    -> { redirect_to production_formulas_url(production_schedule_id: params[:entry][:production_schedule_id]) },
                    -> { render :new }
    )
  end

  protected

  def entry
    @entry ||= WeeksSupplyCalc.new(formula.attributes).merge_hash(formula_params)
  end

  def formula_create
    NewFormula.call(formula_params)
  end

  def formula_params
    return {} if params[:entry].nil?

    params
      .require(:entry)
      .permit(:master_formula_id, :production_schedule_id, :total_week)
  end

  def formula
    @formula ||= WeeksSupplyCalc.new(formula_params)
  end
end
