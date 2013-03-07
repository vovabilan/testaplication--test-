require 'spec_helper'

describe CategoriesController do

  let(:company) { FactoryGirl.create(:company) }
  let(:category) { FactoryGirl.create(:category, company: company) }
  let(:category_params) { FactoryGirl.attributes_for(:category).merge!(company_id: company.id) }
  let(:supper_admin) { FactoryGirl.create(:supper_admin) }

  before(:each) {
    company
    category
    controller.stub(:current_user).and_return(supper_admin) 
  }

  describe "#index" do
    it "can GET 'index'" do
      get :index
      response.should be_success
    end

    it "populates a list of companies" do
      get :index
      expect(assigns(:categories)).to eq([category])
    end
  end

  it 'GET new' do
    get :new
    expect(assigns(:category)).not_to be_nil
    expect(assigns(:companies)).not_to be_nil
    response.should render_template :new
  end

  describe 'POST create' do
    it 'should create new company' do
      post :create, category: category_params
      expect(assigns(:companies)).not_to be_nil
      expect(assigns(:category)).not_to be_nil
      expect(assigns(:category).errors).to be_blank
      response.should redirect_to categories_path
    end

    it 'should not create new company' do
      category_params.delete(:name)
      post :create, category: category_params
      expect(assigns(:companies)).not_to be_nil
      expect(assigns(:category)).not_to be_nil
      expect(assigns(:category).errors).not_to be_blank
      response.should render_template :new
    end
  end

  describe 'DELETE create' do
    it 'should create new company' do
      expect { delete :destroy, id: category.id }.to change{Category.count}.by(-1)
      expect(assigns(:category)).not_to be_nil
      response.should redirect_to categories_path
    end
  end

end