require 'rails_helper'

RSpec.describe ProductionItem, type: :model do
  subject { build(:production_item) }

  it { is_expected.to belong_to(:created_by) }
  it { is_expected.to belong_to(:updated_by) }
  it { is_expected.to belong_to(:production_formula) }
  it { is_expected.to belong_to(:item_master) }
  it { is_expected.to have_one(:master_formula).through(:item_master) }

  it { is_expected.to validate_presence_of(:item_master_id) }
  it { is_expected.to validate_presence_of(:production_formula_id) }
  it { is_expected.to validate_uniqueness_of(:item_master_id).scoped_to(:production_formula_id) }
  it { is_expected.to validate_numericality_of(:quantity).is_greater_than_or_equal_to(0) }

  describe 'tons' do
    let(:production_item) { build(:production_item) }
    subject { production_item.tons }

    it { is_expected.to eq(production_item.quantity * production_item.item_master.weight / 2000) }
  end

  describe 'components' do
    let(:production_item) { build(:production_item) }
    subject { production_item.components }

    it { is_expected.to eq(production_item.quantity * production_item.item_master.weight / \
                          production_item.master_formula.formula_components.to_a.sum { |formula| \
                          formula.blend_percentage * (1 - formula.component_shrinkage.shrinkage) } / \
                          2000) }
  end
end
