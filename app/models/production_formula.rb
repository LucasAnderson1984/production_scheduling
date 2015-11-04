class ProductionFormula < ActiveRecord::Base
  belongs_to  :created_by, class_name: 'User', foreign_key: :creator_id
  belongs_to  :updated_by, class_name: 'User', foreign_key: :updater_id
  belongs_to  :master_formula
  belongs_to  :production_schedule
  has_many    :production_items, dependent: :destroy

  validates :master_formula_id, :production_schedule_id, presence: true
  validates :production_schedule_id, uniqueness: { scope: :master_formula_id }
  validates :tonnage, numericality: { greater_than_or_equal_to: 0, only_integer: true, allow_blank: true }
end
