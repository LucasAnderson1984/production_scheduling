class ProductionFormulasController < ApplicationController
  before_action :set_production_formula, only: [:show, :edit, :update, :destroy]
  before_filter :can_view
  before_action :has_param, only: [:index, :new]

  def index
    @production_formulas = ProductionFormula.all
  end

  def show
  end

  def new
    @production_formula = ProductionFormula.new
  end

  def edit
  end

  def create
    @production_formula = ProductionFormula.new(production_formula_params)

    respond_to do |format|
      if @production_formula.save
        format.html { redirect_to production_formulas_url(production_schedule_id: @production_formula.production_schedule.id), notice: 'Production Formula was successfully created.' }
        format.json { render :index, status: :created, location: production_formulas_url(production_schedule_id: @production_formula.production_schedule.id) }
      else
        format.html { render :new }
        format.json { render json: @production_formula.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @production_formula.update(production_formula_params)
        format.html { redirect_to production_formulas_url(production_schedule_id: @production_formula.production_schedule.id), notice: 'Production Formula was successfully updated.' }
        format.json { render :index, status: :ok, location: production_formulas_url(production_schedule_id: @production_formula.production_schedule.id) }
      else
        format.html { render :edit }
        format.json { render json: @production_formula.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @production_formula.destroy
    respond_to do |format|
      format.html { redirect_to production_formulas_url(production_schedule_id: @production_formula.production_schedule.id), notice: 'Production Formula was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_production_formula
      @production_formula = ProductionFormula.find(params[:id])
    end

    def production_formula_params
      params.require(:production_formula).permit(:master_formula_id, :production_schedule_id, :tonnage)
    end

    def has_param
      unless params[:production_schedule_id]
        redirect_to root_path()
      end
    end
end
