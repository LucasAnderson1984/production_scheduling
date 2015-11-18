require 'rails_helper'

RSpec.describe MasterFormula, type: :model do
  subject { build(:master_formula) }

  it { is_expected.to have_many(:item_masters) }
  it { is_expected.to have_many(:formula_components) }
  it { is_expected.to have_many(:production_formulas) }
  it { is_expected.to have_many(:weeks_supplies) }

  describe 'item_name' do
    let(:master_formula) { build(:master_formula) }
    subject { master_formula.formula_name }

    it { is_expected.to eq(master_formula.formula_number + ' - ' + master_formula.formula_description)}
  end
end
