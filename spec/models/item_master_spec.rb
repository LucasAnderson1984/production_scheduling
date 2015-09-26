require 'rails_helper'

RSpec.describe ItemMaster, type: :model do
  it { is_expected.to belong_to(:master_formula) }
end
