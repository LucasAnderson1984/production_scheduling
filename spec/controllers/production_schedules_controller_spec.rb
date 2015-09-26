require 'rails_helper'

RSpec.describe ProductionSchedulesController, type: :controller do
  before do
    sign_in(user)
  end

  let(:production_schedule) { create(:production_schedule) }
  let(:user) { build(:user, :all_roles) }

  describe 'POST create' do
    let(:production_schedule_params) { attributes_for(:production_schedule) }

    before do
      post :create, production_schedule: production_schedule_params
    end

    context 'when production schedules are valid' do
      it { is_expected.to respond_with(302) }
      it { is_expected.to redirect_to(production_schedule_path(ProductionSchedule.last)) }
      it { is_expected.to set_flash[:notice] }
    end

    context 'when production schedules are not valid' do
      let(:production_schedule_params) { attributes_for(:production_schedule, production_date: nil) }

      it { is_expected.to respond_with(200) }
      it { is_expected.to render_template(:new) }
    end
  end

  describe 'PATCH update' do
    before do
      patch :update, id: production_schedule.id, production_schedule: production_schedule_params
    end

    context 'when production schedules are valid' do
      let(:production_schedule_params) { attributes_for(:production_schedule) }

      it { is_expected.to respond_with(302) }
      it { is_expected.to redirect_to(production_schedule_path(production_schedule.id)) }
      it { is_expected.to set_flash[:notice] }
    end

    context 'when production schedules are not valid' do
      let(:production_schedule_params) { attributes_for(:production_schedule, production_date: nil) }

      it { is_expected.to respond_with(200) }
      it { is_expected.to render_template(:edit) }
    end
  end

  describe 'GET new' do
      before { get :new }

      it { is_expected.to respond_with(200) }
      it { is_expected.to render_template(:new) }
  end

  describe 'GET edit' do
    before { get :edit, id: production_schedule.id }

    it { is_expected.to respond_with(200) }
    it { is_expected.to render_template(:edit) }
  end
end
