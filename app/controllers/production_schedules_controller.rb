class ProductionSchedulesController < ApplicationController
  before_action :set_production_schedule, only: [:show, :edit, :update, :destroy]
  before_filter :can_view

  # GET /customers
  # GET /customers.json
  def index
    @production_schedules = ProductionSchedule.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @production_schedule = ProductionSchedule.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @production_schedule = ProductionSchedule.new(production_schedule_params)

    respond_to do |format|
      if @production_schedule.save
        format.html { redirect_to @production_schedule, notice: 'Production schedule was successfully created.' }
        format.json { render :show, status: :created, location: @production_schedule }
      else
        format.html { render :new }
        format.json { render json: @production_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @production_schedule.update(production_schedule_params)
        format.html { redirect_to @production_schedule, notice: 'Production schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @production_schedule }
      else
        format.html { render :edit }
        format.json { render json: @production_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @production_schedule.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Production schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production_schedule
      @production_schedule = ProductionSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def production_schedule_params
      params.require(:production_schedule).permit(:production_date)
    end
end
