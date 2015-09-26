require 'rails_helper'

RSpec.describe ProductionSchedule, type: :model do
  subject { create(:production_schedule) }

  it { is_expected.to belong_to(:created_by) }
  it { is_expected.to belong_to(:updated_by) }

  it { is_expected.to validate_presence_of(:production_date) }
  it { is_expected.to validate_uniqueness_of(:production_date) }
end
