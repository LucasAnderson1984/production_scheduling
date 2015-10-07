require 'rails_helper'

RSpec.describe MasterFormula, type: :model do
  subject { build(:master_formula) }

  it { is_expected.to have_many(:item_masters) }
  it { is_expected.to have_many(:formula_components) }
  it { is_expected.to have_many(:production_formulas) }
end
