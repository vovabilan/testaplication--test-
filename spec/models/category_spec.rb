require 'spec_helper'

describe Category do

  let(:category) { FactoryGirl.build(:category) }

  context 'validations' do

    it { should have(1).error_on(:name) }

  end
end