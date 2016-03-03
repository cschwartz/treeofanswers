require 'rails_helper'

RSpec.describe RequestsController, :type => :controller do
  include Devise::TestHelpers

  describe '#show' do
    let(:alice) { create :user }

    before(:each) do
      sign_in alice
    end

    describe 'with a valid request' do
      let!(:bob) { create :user, email: 'bob@example.net'}
      let!(:charlene) { create :user, email: 'charlene@example.net'}
      let!(:request) { create :request, user: alice, respondents: [bob, charlene] }

      it 'assigns the created request' do
        get :show, params: { id: request.id }
        expect(assigns(:request)).to eq(request)
      end
    end

  end
end
