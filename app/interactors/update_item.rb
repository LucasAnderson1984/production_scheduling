class UpdateItem
  include Interactor

  before :find_user
  delegate :user, to: :context

  def call
    ProductionItem.transaction do
      update_item
      user.save!
    end
    context.message = 'Production item was successfully updated.'
  end

  def update_item
    user.update_attributes(production_item_params)
  end

  def production_item_params
    context.to_h.slice(:production_formula_id, :item_master_id, :quantity)
  end

  def find_user
    context.user = ProductionItem.find(context.id)
  end
end
