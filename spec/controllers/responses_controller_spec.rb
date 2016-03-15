require 'rails_helper'

RSpec.describe ResponsesController, :type => :controller do
  include Devise::TestHelpers

  let(:alice) { create :user }
  let!(:bob) { create :user, email: 'bob@example.com' }
  let!(:charlene) { create :user, email: 'charlene@example.com' }

  let!(:first_request) { create :request, user: bob, description: 'My description', respondents: [alice, charlene] }

  before(:each) do
    sign_in bob
  end

  describe '#index' do
    it 'should be okay' do
      get :index
      expect(response).to be_ok
    end

    it "assigns bob's responses" do
      get :index
      expect(assigns(:responses)).to eq(bob.responses)
    end
  end
end
