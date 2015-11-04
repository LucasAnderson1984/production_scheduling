class NewItem
  include Interactor

  def call
    ProductionItem.transaction do
      context.production_item = build_item
      context.production_item.save!
    end
    context.message = 'Production item was successfully created.'
    ProductionItemUpsertWorker.perform_async(context.production_item.id, context.total_week)
  end

  protected

  def build_item
    ProductionItem.new(production_item_params)
  end

  def production_item_params
    context.to_h.slice(:production_formula_id, :item_master_id, :quantity)
  end
end
