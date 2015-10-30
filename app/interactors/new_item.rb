class NewItem
  include Interactor

  def call
    ProductionItem.transaction do
      context.production_item = build_item
      context.production_item.save!
    end
  end

  protected

  def build_item(production_item_params)
    ProductionItem.new(production_item_params)
  end
end
