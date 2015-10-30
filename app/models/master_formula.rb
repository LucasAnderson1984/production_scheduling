class MasterFormula < ActiveRecord::Base
  has_many :item_masters
  has_many :formula_components
  has_many :production_formulas
  has_many :weeks_supplies

  def formula_name
    formula_number + ' - ' + formula_description
  end

  scope :ordered, lambda { order("formula_number ASC") }
end
