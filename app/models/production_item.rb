class ProductionItem < ActiveRecord::Base
  belongs_to :created_by, class_name: 'User', foreign_key: :creator_id
  belongs_to :updated_by, class_name: 'User', foreign_key: :updater_id
  belongs_to :production_formula
  belongs_to :item_master
  has_one    :master_formula, through: :item_master

  validates :item_master_id, :production_formula_id, presence: true
  validates :item_master_id, uniqueness: { scope: :production_formula_id }
  validates :quantity, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def tons
    quantity * item_master.weight / 2000
  end

  def components
    quantity * item_master.weight / master_formula.formula_components.to_a.sum { |formula| formula.blend_percentage * \
                                                            (1 - formula.component_shrinkage.shrinkage) } / 2000
  end
end
