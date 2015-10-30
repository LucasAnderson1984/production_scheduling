class ProductionItem < ActiveRecord::Base
  belongs_to :created_by, class_name: 'User', foreign_key: :creator_id
  belongs_to :updated_by, class_name: 'User', foreign_key: :updater_id
  belongs_to :production_formula
  belongs_to :item_master

  validates :item_master_id, :production_formula_id, presence: true
  validates :production_formula_id, uniqueness: { scope: :item_master_id }
  validates :quantity, numericality: { only_integer: true }

  def tons
    quantity * item_master.weight / 2000
  end
end
