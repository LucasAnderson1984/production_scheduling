class ProductionSchedule < ActiveRecord::Base
  belongs_to :created_by, class_name: 'User', foreign_key: :creator_id
  belongs_to :updated_by, class_name: 'User', foreign_key: :updater_id

  validates :production_date, uniqueness: true, presence: true
end
