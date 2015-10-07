require 'rails_helper'

RSpec.describe ProductionFormulasController, type: :controller do
  before do
    sign_in(user)
  end

  let(:master_formula) { create(:master_formula) }
  let(:production_schedule) { create(:production_schedule) }
  let(:production_formula) { create(:production_formula, master_formula_id: master_formula.id, production_schedule_id: production_schedule.id) }
  let(:user) { build(:user, :all_roles) }

  describe 'POST create' do
    let(:production_formula_params) { attributes_for(:production_formula, master_formula_id: master_formula.id, production_schedule_id: production_schedule.id) }

    before do
      post :create, production_formula: production_formula_params
    end

    context 'when production formulas are valid' do
      it { is_expected.to respond_with(302) }
      it { is_expected.to redirect_to(production_formulas_path(production_schedule_id: ProductionFormula.last.production_schedule_id)) }
      it { is_expected.to set_flash[:notice] }
    end

    context 'when production formulas are not valid' do
      let(:production_formula_params) { attributes_for(:production_formula, tonnage: 1.5) }

      it { is_expected.to respond_with(200) }
      it { is_expected.to render_template(:new) }
    end
  end

  describe 'PATCH update' do
    before do
      patch :update, id: production_formula.id, production_formula: production_formula_params
    end

    context 'when production formulas are valid' do
      let(:production_formula_params) { attributes_for(:production_formula) }

      it { is_expected.to respond_with(302) }
      it { is_expected.to redirect_to(production_formulas_path(production_schedule_id: production_formula.production_schedule_id)) }
      it { is_expected.to set_flash[:notice] }
    end

    context 'when production formulas are not valid' do
      let(:production_formula_params) { attributes_for(:production_formula, tonnage: 1.5) }

      it { is_expected.to respond_with(200) }
      it { is_expected.to render_template(:edit) }
    end
  end

  describe 'DELETE destroy' do
    before do
      delete :destroy, id: production_formula
    end

    context 'when production formulas are valid' do
      let(:production_formula) { create(:production_formula) }

      it { is_expected.to respond_with(302) }
      it { is_expected.to redirect_to(production_formulas_url(production_schedule_id: production_formula.production_schedule_id)) }
      it { is_expected.to set_flash[:notice] }
    end
  end

  describe 'GET new' do
    context 'when new has a production scheule id paramter' do
      before { get :new, production_schedule_id: production_schedule }

      it { is_expected.to respond_with(200) }
      it { is_expected.to render_template(:new) }
    end

    context 'when new does not have a production schedule id parameter' do
      before { get :new }

      it { is_expected.to respond_with(302) }
      it { is_expected.to redirect_to(root_path()) }
    end
  end

  describe 'GET edit' do
    before { get :edit, id: production_formula.id }

    it { is_expected.to respond_with(200) }
    it { is_expected.to render_template(:edit) }
  end

  describe 'Get index' do
    context 'when index has a production schedule id paramter' do
      before { get :index, production_schedule_id: production_schedule }

      it { is_expected.to respond_with(200) }
      it { is_expected.to render_template(:index) }
    end

    context 'when index does not have a production schedule id parameter' do
      before { get :index }

      it { is_expected.to respond_with(302) }
      it { is_expected.to redirect_to(root_path()) }
    end
  end
end
