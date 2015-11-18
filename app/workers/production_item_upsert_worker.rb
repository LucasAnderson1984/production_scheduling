class ProductionItemUpsertWorker
  include Sidekiq::Worker

  def perform(production_item_id, total_week, quantity)
    production_item = ProductionItem.find(production_item_id)
    if total_week.nil?
      production_item.quantity = quantity
    else
      production_item.quantity = calculate_bags(production_item.item_master_id, total_week)
    end
    production_item.save!
    UpdateFormula.call(production_formula_id: production_item.production_formula_id)
  end

  protected

  def calculate_bags(id, total_week)
    weeks_supply = WeeksSupply.where(item_master_id: id).first
    bags = ((weeks_supply.order_average * total_week - (weeks_supply.inventory - weeks_supply.orders)) \
           / weeks_supply.item_master.pallet_quantity).round * weeks_supply.item_master.pallet_quantity \
           * weeks_supply.item_master.units_per_case
    return 0 if bags < 0
    bags
  end
end
