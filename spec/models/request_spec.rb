require 'rails_helper'

RSpec.describe Request, :type => :model do
  it 'creates responses for the provided email addresses' do
    user = create :user
    request = user.request.create description: 'My description', respondents: ['bob@example.net', 'charlene@example.net']
    expect(request.responses).to have(2).items
  end
end
