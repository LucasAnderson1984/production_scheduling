class WeeksSupplyCalc < FormEntry
  attribute :master_formula_id, Integer
  attribute :production_schedule_id, Integer
  attribute :total_week, Decimal

  validates \
    :master_formula_id,
    :production_schedule_id,
    presence: true

  validate :is_unique?

  validates \
    :master_formula_id,
    :production_schedule_id,
    numericality: :only_integer

  validates \
    :total_week,
    numericality: { greater_than_or_equal_to: 0, allow_blank: true }

  #Ask Joe why he doesn't have this on his forms
  def persisted?
    false
  end

  def is_unique?
    unless ProductionFormula.where(master_formula_id: self.master_formula_id, production_schedule_id: \
                                   self.production_schedule_id).count == 0
      errors.add(:master_formula_id, 'Formula must be unique.')
    end
  end
end
