require 'rails_helper'

RSpec.describe 'New request', type: :feature do
  let!(:alice) { create :user }
  let!(:bob) { create :user, email: 'bob@example.net' }
  let!(:charlene) { create :user, email: 'charlene@example.net' }

  describe 'create' do
    describe 'with valid data' do
      before(:each) do
        log_in_as alice
        create_request 'My description', ['bob@example.net', 'charlene@example.net']
      end

      it 'is successful' do
        expect(page).to have_css '.notice', 'Request successfully created.'
      end

      it "shows the request's description" do
        expect(page).to have_css '.description', 'My description'
      end

    end
  end

  def log_in_as(user)
    visit '/'

    click_link 'Log in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end

  def create_request(description, user_emails)
    click_link 'New request'
    fill_in 'Description', with: description
    user_emails.each_with_index do |email, index|
      within "#response-#{index}" do fill_in 'Email', with: email end
    end

    click_button 'Create'
  end
end
