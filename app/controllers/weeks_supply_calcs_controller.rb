class WeeksSupplyCalcsController < ApplicationController
  #before_action :weeks_supply_calc, only: [:new, :create]
  helper_method :entry, :formula

  def create
    respond_to do |format|
      if formula_create
        format.html { redirect_to production_formulas_url(production_schedule_id: params[:entry][:production_schedule_id]), notice: 'Production Formula was successfully created.' }
        format.json { render :index, status: :created, location: production_formulas_url(production_schedule_id: @weeks_supply_calc.production_schedule_id) }
      else
        format.html { render :new, production_schedule_id: params[:production_schedule_id], notice: "Create failed." }
      end
    end
  end

  protected

  def entry
    @entry ||= WeeksSupplyCalc.new(formula.attributes).merge_has(formula_params)
  end

  def formula_create
    NewFormula.call(formula_params)
  end

  def formula_params
    params.require(:entry).permit(:master_formula_id, :production_schedule_id, :total_week)
  end

  def formula
    @formula ||= WeeksSupplyCalc.new(formula_params)
  end
end
