class MasterFormula < ActiveRecord::Base
  has_many :item_masters
  has_many :formula_components
end
