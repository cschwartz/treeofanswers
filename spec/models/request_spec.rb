require 'rails_helper'

RSpec.describe Request, :type => :model do
  let(:alice) { create :user }
  let!(:bob) { create :user, email: 'bob@example.net' }
  let!(:charlene) { create :user, email: 'charlene@example.net' }

  let(:request_attributes) do
    {
      description: 'My description',
      responses_attributes: {
        "0" => {email: 'bob@example.net'},
        "1" => {email: 'charlene@example.net'}
      }
    }
  end

  subject {
    alice.requests.create request_attributes
  }

  it 'creates responses for the provided email addresses' do
    expect(subject.responses.length).to eq(2)
  end

  it 'assigns the first request to bob' do
    expect(subject.responses.first.user.email).to eq('bob@example.net')
  end

  it 'assigns the last request to charlene' do
    expect(subject.responses.last.user.email).to eq('charlene@example.net')
  end
end
