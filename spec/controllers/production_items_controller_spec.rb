require 'rails_helper'

RSpec.describe ProductionItemsController, type: :controller do
  before do
    sign_in(user)
  end

  let(:item_master) { create(:item_master) }
  let(:production_formula) { create(:production_formula) }
  let(:production_item) { create(:production_item, item_master_id: item_master.id, production_formula_id: production_formula.id) }
  let(:user) { build(:user, :all_roles) }

  describe 'POST create' do
    let(:production_item_params) { attributes_for(:production_item, item_master_id: item_master.id, production_formula_id: production_formula.id) }

    before do
      post :create, production_item: production_item_params
    end

    context 'when production items are valid' do
      it { is_expected.to respond_with(302) }
      it { is_expected.to redirect_to(production_items_path(production_formula_id: ProductionItem.last.production_formula_id)) }
      it { is_expected.to set_flash[:notice] }
    end

    context 'when production items are not valid' do
      let(:production_item_params) { attributes_for(:production_item, quantity: 1.5) }

      it { is_expected.to respond_with(200) }
      it { is_expected.to render_template(:new) }
    end
  end

  describe 'PATCH update' do
    before do
      patch :update, id: production_item.id, production_item: production_item_params
    end

    context 'when production items are valid' do
      let(:production_item_params) { attributes_for(:production_item) }

      it { is_expected.to respond_with(302) }
      it { is_expected.to redirect_to(production_items_path(production_formula_id: production_item.production_formula_id)) }
      it { is_expected.to set_flash[:notice] }
    end

    context 'when production items are not valid' do
      let(:production_item_params) { attributes_for(:production_item, quantity: 1.5) }

      it { is_expected.to respond_with(200) }
      it { is_expected.to render_template(:edit) }
    end
  end

  describe 'DELETE destroy' do
    before do
      delete :destroy, id: production_item
    end

    context 'when production items are valid' do
      let(:production_item) { create(:production_item) }

      it { is_expected.to respond_with(302) }
      it { is_expected.to redirect_to(production_items_url(production_formula_id: production_item.production_formula_id)) }
      it { is_expected.to set_flash[:notice] }
    end
  end

  describe 'GET new' do
    context 'when new has a production formula id paramter' do
      before { get :new, production_formula_id: production_formula }

      it { is_expected.to respond_with(200) }
      it { is_expected.to render_template(:new) }
    end

    context 'when new does not have a production formula id parameter' do
      before { get :new }

      it { is_expected.to respond_with(302) }
      it { is_expected.to redirect_to(root_path()) }
    end
  end

  describe 'GET edit' do
    before { get :edit, id: production_item.id }

    it { is_expected.to respond_with(200) }
    it { is_expected.to render_template(:edit) }
  end

  describe 'Get index' do
    context 'when index has a production formula id paramter' do
      before { get :index, production_formula_id: production_formula }

      it { is_expected.to respond_with(200) }
      it { is_expected.to render_template(:index) }
    end

    context 'when index does not have a production formula id parameter' do
      before { get :index }

      it { is_expected.to respond_with(302) }
      it { is_expected.to redirect_to(root_path()) }
    end
  end
end