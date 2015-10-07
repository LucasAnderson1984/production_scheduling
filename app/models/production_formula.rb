class ProductionFormula < ActiveRecord::Base
  belongs_to :created_by, class_name: 'User', foreign_key: :creator_id
  belongs_to :updated_by, class_name: 'User', foreign_key: :updater_id
  belongs_to :master_formula
  belongs_to :production_schedule

  has_many :production_items

  validates :master_formula_id, :production_schedule_id, :tonnage, presence: true
  validates :production_schedule_id, uniqueness: { scope: :master_formula_id }
  validates :tonnage, numericality: { only_integer: true }
end
