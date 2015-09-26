require 'rails_helper'

RSpec.describe MasterFormula, type: :model do
  it { is_expected.to have_many(:item_masters) }
  it { is_expected.to have_many(:formula_components) }
end
