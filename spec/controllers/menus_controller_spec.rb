require 'spec_helper'

describe MenusController do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) { controller.stub(:current_user).and_return(user) }

  context "#index" do
    let!(:company) { FactoryGirl.create(:company) }
    let!(:category) { FactoryGirl.create(:category) }
    let!(:post) { FactoryGirl.create(:post) }

    before(:each) { get :index }
    
    it "should return category" do
      expect(assigns(:categories)).to include(category)
    end
    
    it "shoud return company" do
      expect(assigns(:companies)).to include(company)
    end
    
    it "shoud return post" do
      expect(assigns(:posts)).to include(post)
    end
  end

end
