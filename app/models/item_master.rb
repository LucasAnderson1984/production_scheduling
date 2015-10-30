class ItemMaster < ActiveRecord::Base
  belongs_to  :master_formula
  has_one     :weeks_supply

  def item_name
    item_number + ' - ' + description
  end
end
