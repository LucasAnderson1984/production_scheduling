class WeeksSupplyCalc < FormEntry
  attribute :master_formula_id, Integer
  attribute :production_schedule_id, Integer
  attribute :total_week, Decimal

  validates \
    :master_formula_id,
    :production_schedule_id,
    :total_week,
    presence: true

  validates \
    :master_formula_id,
    :production_schedule_id,
    numericality: :only_integer

  validates \
    :total_week,
    numericality: { greater_than: 0 },
    allow_blank: true

  #Ask Joe why he doesn't have this on his forms
  def persisted?
    false
  end
end
