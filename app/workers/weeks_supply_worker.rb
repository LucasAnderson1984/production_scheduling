class WeeksSupplyWorker
  include Sidekiq::Worker

  def perform(master_formula_id)
    production_items = WeeksSupply.where(master_formula_id: master_formula_id)
  end
end
