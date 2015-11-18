require 'rails_helper'

RSpec.describe ProductionSchedule, type: :model do
  let(:production_schedule) { build(:production_schedule) }
  subject { create(:production_schedule) }

  it { is_expected.to belong_to(:created_by) }
  it { is_expected.to belong_to(:updated_by) }
  it { is_expected.to have_many(:production_formulas).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:production_date) }
  it { is_expected.to validate_uniqueness_of(:production_date) }

  describe 'total_tons' do
    subject { production_schedule.total_tons}
    it { is_expected.to eq(production_schedule.production_formulas.to_a.sum { |f| f.tonnage }) }
  end

  describe 'date_format' do
    subject { production_schedule.date_format }
    it { is_expected.to eq(production_schedule.production_date.strftime('%m/%d/%Y')) }
  end
end
