require 'spec_helper'

describe PostsController do

  let(:category) { FactoryGirl.create(:category) }
  let(:post) { FactoryGirl.create(:post) }
  let(:valid_params) { FactoryGirl.attributes_for(:post) }
  let(:invalid_params) { FactoryGirl.attributes_for(:company, title: '') }
  let(:post_params) { FactoryGirl.attributes_for(:post).merge!(category_ids: [category.id]) }
  let(:user) { FactoryGirl.create(:user) }

  before(:each) {
    category
    post
    controller.stub(:current_user).and_return(user)
  }

  describe "#index" do
    it "can GET 'index'" do
      get :index
      response.should be_success
    end
  end

    it "populates a list of posts" do
      get :index
      expect(assigns(:posts)).to eq([post])
    end

    it 'GET new' do
      get :new
      expect(assigns(:post)).not_to be_nil
      response.should render_template :new
    end

    it 'GET edit' do
      get :edit, id: post.id
      expect(assigns(:post)).not_to be_nil
      response.should render_template :edit
    end

    describe 'POST create' do
      it 'should create new post' do
        post :create => valid_params
        expect(assigns(:posts)).not_to be_nil
        expect(assigns(:categories)).not_to be_nil
        expect(assigns(:post).errors).to be_blank
        response.should redirect_to posts_path
      end

      it 'should not create new post' do
        post_params.delete(:title)
        post :create => invalid_params
        expect(assigns(:post)).not_to be_nil
        expect(assigns(:categories)).not_to be_nil
        expect(assigns(:post).errors).not_to be_blank
        response.should render_template :new
      end
    end

    describe 'DELETE create' do
      it 'should create new company' do
        expect { delete :destroy, id: post.id }.to change{Post.count}.by(-1)
        expect(assigns(:post)).not_to be_nil
        response.should redirect_to posts_path
      end
    end
end