class ItemMaster < ActiveRecord::Base
  belongs_to :master_formula

  def item_name
    item_number + ' - ' + description
  end
end
