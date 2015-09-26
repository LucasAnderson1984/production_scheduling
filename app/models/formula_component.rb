class FormulaComponent < ActiveRecord::Base
  belongs_to :master_formula
  belongs_to :component_shrinkage
end
