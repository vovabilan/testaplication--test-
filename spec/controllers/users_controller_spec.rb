require 'spec_helper'

describe UsersController do

  let(:user) { FactoryGirl.create(:user) }
  let(:company) { FactoryGirl.create(:company) }
  let(:user_params) { FactoryGirl.attributes_for(:user).merge!(company_id: company.id) }

  it 'should get new' do
    get :new
    response.should be_success
    flash.should be_blank
    assigns[:user].should_not be_nil
    response.should render_template :new
  end

  describe 'post create'
    it 'should create new user' do
      [:token, :auth_token].each { |k| user_params.delete k }
      post :create, :user => user_params
      flash[:notice].should_not be_blank
      assigns[:user].should_not be_nil
      assigns[:user].errors.should be_blank
      response.should redirect_to root_path
    end

    it 'should not create new user' do
      [:token, :auth_token, :email].each { |k| user_params.delete k }
      post :create, :user => user_params
      flash.should be_blank
      assigns[:user].should_not be_nil
      assigns[:user].errors.should_not be_blank
      response.should render_template :new
    end

  describe 'get edit' do
    it 'should activate user' do
      get :edit, :id => user.token
      assigns[:user].should_not be_nil
      flash[:notice].should_not be_blank
      response.should redirect_to root_path
    end
    it 'should not activate user' do
      get :edit, :id => 0
      flash.should be_blank
      assigns[:user].should be_nil
      response.should redirect_to root_path
    end
  end

end
