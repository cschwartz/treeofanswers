require 'rails_helper'

RSpec.describe User, :type => :model do
  describe '#build_request' do
    let(:alice) { build :user}

    it 'builds a request for alice' do
      request = alice.build_request()
      expect(alice.requests).to include(request)
    end

    it 'builds the default number of response objects' do
      request = alice.build_request()
      expect(request.responses.length).to eq(2)
    end
  end
end
