require 'spec_helper'

describe CompaniesController do

  let(:company) { FactoryGirl.create(:company) }
  let(:company_params) { FactoryGirl.attributes_for(:company) }
  let(:invalid_params) { FactoryGirl.attributes_for(:company, name: '') }
  let(:supper_admin) { FactoryGirl.create(:supper_admin, company: company) }

  before(:each) {
    company
    controller.stub(:current_user).and_return(supper_admin)
  }

  describe "#index" do
      it "can GET 'index'" do
        get :index
        response.should be_success
      end

      it "populates a list of companies" do
        get :index
        expect(assigns(:companies)).to eq([company])
      end
    end

      it 'GET new' do
        get :new
        expect(assigns(:company)).not_to be_nil
        response.should render_template :new
      end

  describe '#update' do
      it 'should update the company' do
        put :update, id: company, company: company_params
        response.should redirect_to companies_path(company)
      end
  
      it 'should not update the company' do
        put :update, id: company, company: invalid_params
        assigns[:company].errors.should_not be_blank
        response.should render_template(:edit)
      end
    end
  
  describe 'GET create' do
      it 'should create new company' do
        post :create, :company => company_params
        expect(assigns(:posts)).to be_nil
        expect(assigns(:company).errors).to be_blank
        response.should redirect_to companies_path
      end

      it 'should not create new company' do
        post :create, :company => company_params
        expect(assigns(:company)).not_to be_nil
        expect(assigns(:company).errors).to be_blank
        response.should redirect_to companies_path
      end
    end

  describe 'DELETE create' do
      it 'should create new company' do
        expect { delete :destroy, id: company.id }.to change{Company.count}.by(-1)
        expect(assigns(:company)).not_to be_nil
        response.should redirect_to companies_path
      end
    end
end