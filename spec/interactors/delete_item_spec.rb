require 'rails_helper'

RSpec.describe DeleteItem, type: :service do
  describe '.call' do
    let(:production_formula) { create(:production_formula) }
    let(:item_master) { create(:item_master) }
    let(:quantity) { Faker::Number.number(4).to_i }

    let(:context) do
      DeleteItem.call(
        production_formula_id: production_formula.id,
        item_master_id: item_master.id,
        quantity: quantity)
    end
  end
end
