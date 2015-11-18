require 'rails_helper'

RSpec.describe ProductionFormula, type: :model do
  subject { build(:production_formula) }

  it { is_expected.to belong_to(:created_by) }
  it { is_expected.to belong_to(:updated_by) }
  it { is_expected.to belong_to(:master_formula) }
  it { is_expected.to belong_to(:production_schedule) }
  it { is_expected.to have_many(:production_items).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:master_formula_id) }
  it { is_expected.to validate_presence_of(:production_schedule_id) }
  it { is_expected.to validate_uniqueness_of(:production_schedule_id).scoped_to(:master_formula_id) }
  it { is_expected.to validate_numericality_of(:tonnage).allow_nil.is_greater_than_or_equal_to(0) }

  describe 'tons' do
    let (:production_formula) { build(:production_formula) }
    subject { production_formula.tons }

    it { is_expected.to eq(production_formula.production_items.to_a.sum { |item| item.tons }) }
  end

  describe 'components' do
    let (:production_formula) { build(:production_formula) }
    subject { production_formula.components }

    it { is_expected.to eq(production_formula.production_items.to_a.sum { |item| item.components}) }
  end
end
