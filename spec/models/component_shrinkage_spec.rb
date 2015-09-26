require 'rails_helper'

RSpec.describe ComponentShrinkage, type: :model do
  it { is_expected.to have_many(:formula_components) }
end
