class ProductionSchedulesController < ApplicationController
  before_action :set_production_schedule, only: [:show, :edit, :update, :destroy]
  before_filter :can_view

  def index
    @production_schedules = ProductionSchedule.all.ordered
  end

  def show
  end

  def new
    @production_schedule = ProductionSchedule.new
  end

  def edit
  end

  def create
    @production_schedule = ProductionSchedule.new(production_schedule_params)

    respond_to do |format|
      if @production_schedule.save
        format.html { redirect_to production_schedules_url, notice: 'Production Schedule was successfully created.' }
        format.json { render :index, status: :created, location: production_schedules_url }
      else
        format.html { render :new }
        format.json { render json: @production_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @production_schedule.update(production_schedule_params)
        format.html { redirect_to production_schedules_url, notice: 'Production Schedule was successfully updated.' }
        format.json { render :index, status: :ok, location: production_schedules_url }
      else
        format.html { render :edit }
        format.json { render json: @production_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @production_schedule.destroy
    respond_to do |format|
      format.html { redirect_to production_schedules_url, notice: 'Production Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_production_schedule
      @production_schedule = ProductionSchedule.find(params[:id])
    end

    def production_schedule_params
      params.require(:production_schedule).permit(:production_date)
    end
end
