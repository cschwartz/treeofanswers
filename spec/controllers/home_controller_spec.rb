require 'rails_helper'

RSpec.describe HomeController, :type => :controller do
  describe 'GET index' do
    it 'should be ok' do
      get :index
      expect(response).to be_ok
    end
  end
end
