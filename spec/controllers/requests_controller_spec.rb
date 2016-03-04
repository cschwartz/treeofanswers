require 'rails_helper'

RSpec.describe RequestsController, :type => :controller do
  include Devise::TestHelpers

  let(:alice) { create :user }
  let!(:bob) { create :user, email: 'bob@example.net'}
  let!(:charlene) { create :user, email: 'charlene@example.net'}

  let!(:request) { create :request, user: alice, respondents: [bob, charlene] }

  before(:each) do
    sign_in alice
  end

  describe '#index' do
    it 'should be okay' do
      get :index
      expect(response).to be_ok
    end

    it "assigns alice's requests" do
      get :index
      expect(assigns(:requests)).to eq(alice.requests)
    end
  end

  describe '#show' do
    describe 'with a valid request' do
      it 'assigns the created request' do
        get :show, params: { id: request.id }
        expect(assigns(:request)).to eq(request)
      end
    end
  end
end
