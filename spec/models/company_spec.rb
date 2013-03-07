require 'spec_helper'

describe Company do

  let(:company) { FactoryGirl.build(:company) }

  context 'validations' do

    it { should have(2).error_on(:name) }
    it { should have(3).error_on(:email) }
  end
end
