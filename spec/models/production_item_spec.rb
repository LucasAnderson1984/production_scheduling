require 'rails_helper'

RSpec.describe ProductionItem, type: :model do
  subject { build(:production_item) }

  it { is_expected.to belong_to(:created_by) }
  it { is_expected.to belong_to(:updated_by) }
  it { is_expected.to belong_to(:production_formula) }

  it { is_expected.to validate_presence_of(:item_master_id) }
  it { is_expected.to validate_presence_of(:production_formula_id) }
  it { is_expected.to validate_uniqueness_of(:production_formula_id).scoped_to(:item_master_id) }
  it { is_expected.to validate_numericality_of(:quantity).only_integer }
end
