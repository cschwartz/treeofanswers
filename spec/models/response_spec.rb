require 'rails_helper'

RSpec.describe Request, :type => :model, focus: true do
  let(:alice) { create :user }
  let!(:bob) { create :user, email: 'bob@example.net' }
  let!(:charlene) { create :user, email: 'charlene@example.net' }

  let(:response_attributes) do
    {
      status: 'edited',
      description: 'My helpful description',
      responses_attributes: {
        "0" => {email: 'bob@example.net'},
        "1" => {email: 'charlene@example.net'}
      }
    }
  end

  let!(:request) {
    create :request, user: bob, description: 'My description', respondents: [alice, charlene]
  }

  subject { request.responses.first }

  describe "when delegating " do
    before(:each) do
      subject.update_attributes(response_attributes.without(:description))
    end

    it 'is valid' do
      expect(subject).to be_valid
    end

    it 'creates responses for the new respondents' do
      expect(subject.responses.length).to eq(2)
    end

    it 'has no description' do
      expect(subject.description).to be_nil
    end
  end

  describe 'when answering ' do
    before(:each) do
      subject.update_attributes(response_attributes.without(:responses_attributes))
    end

    it 'is valid' do
      expect(subject).to be_valid
    end

    it 'has the new description' do
      expect(subject.description).to eq('My helpful description')
    end

    it 'is not delegated' do
      expect(subject.responses).to be_empty
    end
  end

  describe 'when delegating and answering ' do
    before(:each) do
      subject.update_attributes(response_attributes)
    end

    it 'is valid' do
      expect(subject).to be_valid
    end

    it 'creates responses for the new respondents' do
      expect(subject.responses.length).to eq(2)
    end

    it 'has the new description' do
      expect(subject.description).to eq('My helpful description')
    end
  end

  describe 'when failing to delegate or answer ' do
    it 'is invalid' do
      invalid_response_attributes = {
        status: 'edited',
        description: '',
        responses_attributes: {
        }
      }
      subject.update_attributes(invalid_response_attributes)
      expect(subject).to be_invalid
    end
  end
end
