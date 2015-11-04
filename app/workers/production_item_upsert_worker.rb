class ProductionItemUpsertWorker
  include Sidekiq::Worker

  def perform(production_item_id, total_week)
    production_item = ProductionItem.find(production_item_id)
    production_item.quantity = calculate_bags(production_item.item_master_id, total_week)
    production_item.save!
  end

  protected

  def calculate_bags(id, total_week)
    weeks_supply = WeeksSupply.where(item_master_id: id).first
    bags = ((weeks_supply.order_average * total_week - (weeks_supply.inventory - weeks_supply.orders)) \
           / weeks_supply.item_master.pallet_quantity).round * weeks_supply.item_master.pallet_quantity
    return bags if bags >= 0
    return 0
  end
end
