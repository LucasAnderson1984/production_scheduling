require 'rails_helper'

RSpec.describe WeeksSupply, type: :model do
  it { is_expected.to belong_to(:item_master) }
  it { is_expected.to belong_to(:master_formula) }
end
