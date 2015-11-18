class ProductionItemsController < ApplicationController
  before_filter :can_view
  before_action :has_param, only: [:index, :new]
  helper_method :entry, :item, :formula
  respond_to :html

  def index
    @production_items = ProductionItem.where(production_formula_id: params[:production_formula_id])
  end

  def create
    render :new and return unless entry.valid?

    handle_service_result(item_create,
                    -> { redirect_to production_items_url(production_formula_id: params[:entry][:production_formula_id]) },
                    -> { render :new })
  end

  def update
    render :edit and return unless entry.valid?

    handle_service_result(item_update,
                    -> { redirect_to production_items_url(production_formula_id: item.production_formula_id) },
                    -> { render :edit })
  end

  def destroy
    item_delete
    respond_to do |format|
      format.html { redirect_to production_items_url(production_formula_id: item.production_formula_id), \
                    notice: 'Production Item was successfully destroyed.' }
    end
  end

  private
    def entry
      return @entry ||= ProductionItem.new(item_params) \
        if %{create new}.include?(params[:action])
      @entry ||= find_item
    end

    def item_create
      NewItem.call(item_params)
    end

    def item_update
      UpdateItem.call(item_params.merge(id: item.id))
    end

    def item_delete
      DeleteItem.call(item.attributes)
    end

    def item_params
      return {} if params[:entry].nil?

      params
        .require(:entry)
        .permit(:item_master_id, :production_formula_id, :quantity)
    end

    def item
      @production_item ||= params[:id] ? find_item : build_item
    end

    def build_item
      ProductionItem.new(item_params)
    end

    def find_item
      ProductionItem.find(params[:id])
    end

    def has_param
      if params[:production_formula_id]
        @production_formula = ProductionFormula.find(params[:production_formula_id])
      else
        redirect_to root_path()
      end
    end

    def formula
      @production_formula ||= find_formula
    end

    def find_formula
      @production_formula ||= params[:production_formula_id] ? ProductionFormula.find(params[:production_formula_id]) : \
                                                               ProductionFormula.find(params[:entry][:production_formula_id])
    end
end
