require 'rails_helper'

RSpec.describe ItemMaster, type: :model do
  let(:item_master) { build(:item_master) }
  subject { item_master }

  it { is_expected.to belong_to(:master_formula) }
  it { is_expected.to have_one(:weeks_supply) }

  describe 'item_name' do
    subject { item_master.item_name }
    it { is_expected.to eq(item_master.item_number + ' - ' + item_master.description)}
  end

  describe 'pallet_quantity' do
    subject { item_master.pallet_quantity }
    it { is_expected.to eq(item_master.pallet_height * item_master.cases_per_layer)}
  end
end
