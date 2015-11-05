require 'rails_helper'

RSpec.describe NewItem, type: :service do
  describe '.call' do
      let(:production_formula) { create(:production_formula) }
      let(:item_master) { create(:item_master) }
      let(:quantity) { Faker::Number.number(4).to_i }

      let(:context) do
        NewItem.call(
          production_formula_id: production_formula.id,
          item_master_id: item_master.id,
          quantity: quantity)
      end

      context 'when the items are valid' do
      describe Interactor::Context do
        subject { context }

        its(:success?) { is_expected.to be true }
        its(:message) do
          is_expected
            .to eq('Production item was successfully created.')
        end

        describe '#item' do
          subject { context.production_item }

          it { is_expected.to be_present }
          it { is_expected.to be_persisted }
          its(:production_formula_id) { is_expected.to eq(production_formula.id) }
          its(:item_master_id) { is_expected.to eq(item_master.id) }
          its(:quantity) { is_expected.to eq(quantity) }
        end
      end
    end
  end
end
