class ProductionSchedule < ActiveRecord::Base
  belongs_to :created_by, class_name: 'User', foreign_key: :creator_id
  belongs_to :updated_by, class_name: 'User', foreign_key: :updater_id

  has_many :production_formulas, dependent: :destroy

  validates :production_date, uniqueness: true, presence: true

  def total_tons
    production_formulas.to_a.sum { |f| f.tonnage }
  end

  def date_format
    production_date.strftime('%m/%d/%Y')
  end

  scope :ordered, lambda { order("production_date ASC") }
end
