class ProductionItemsController < ApplicationController
  before_action :set_production_item, only: [:show, :edit, :update, :destroy]
  before_filter :can_view
  before_action :has_param, only: [:index, :new]

  def index
    @production_items = ProductionItem.all
  end

  def show
  end

  def new
    @production_item = ProductionItem.new
  end

  def edit
  end

  def create
    @production_item = ProductionItem.new(production_item_params)

    respond_to do |format|
      if @production_item.save
        format.html { redirect_to production_items_url(production_formula_id: @production_item.production_formula.id), notice: 'Production Item was successfully created.' }
        format.json { render :index, status: :created, location: production_items_url(production_formula_id: @production_item.production_formula_id) }
      else
        format.html { render :new }
        format.json { render json: @production_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @production_item.update(production_item_params)
        format.html { redirect_to production_items_url(production_formula_id: @production_item.production_formula.id), notice: 'Production Item was successfully updated.' }
        format.json { render :index, status: :ok, location: production_items_url(production_formula_id: @production_item.production_formula_id) }
      else
        format.html { render :edit }
        format.json { render json: @production_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @production_item.destroy
    respond_to do |format|
      format.html { redirect_to production_items_url(production_formula_id: @production_item.production_formula_id), notice: 'Production Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_production_item
      @production_item = ProductionItem.find(params[:id])
    end

    def production_item_params
      params.require(:production_item).permit(:item_master_id, :production_formula_id, :quantity)
    end

    def has_param
      unless params[:production_formula_id]
        redirect_to root_path()
      end
    end
end
