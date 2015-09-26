require 'rails_helper'

RSpec.describe FormulaComponent, type: :model do
  it { is_expected.to belong_to(:master_formula) }
  it { is_expected.to belong_to(:component_shrinkage) }
end
