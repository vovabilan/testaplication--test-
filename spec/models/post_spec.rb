require 'spec_helper'

describe Post do

  let(:post) { FactoryGirl.build(:post) }

  context 'validations' do

    it { should have(1).error_on(:title) }
    it { should have(1).error_on(:published_at) }
  end
end