class WeeksSupply < ActiveRecord::Base
  self.table_name = 'vw_order_average'
  self.primary_key = 'item_number'

  belongs_to  :item_master
  belongs_to  :master_formula
end
