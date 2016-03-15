require 'rails_helper'

RSpec.describe ResponsesHelper, :type => :helper do
  describe 'status_for' do
    it 'returns an icon for "open" status' do
      response = double(status: "open")
      expect(helper.status_for(response)).to eq("fa fa-question-circle")
    end

    it 'returns an icon for "delegated" status' do
      response = double(status: "delegated")
      expect(helper.status_for(response)).to eq("fa fa-share")
    end

    it 'returns an icon for "answered" status' do
      response = double(status: "answered")
      expect(helper.status_for(response)).to eq("fa fa-commenting")
    end

    it 'returns an icon for "accepted" status' do
      response = double(status: "accepted")
      expect(helper.status_for(response)).to eq("fa fa-check")
    end
  end
end
