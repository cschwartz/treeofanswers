require 'rails_helper'

RSpec.describe 'New request', type: :feature do
  before :each do
    create :user
  end

  describe 'create' do
    it 'with valid data' do
      visit '/'
      click_link 'Log in'
      fill_in 'Email', with: 'alice@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      click_link 'New request'
      fill_in 'Description', with: 'My description'
      fill_in 'Respondents', with: 'bob@example.net charlene@example.net'
      click_button 'Create'

      expect(page).to have_css '.notice', 'Request successfully created.'
    end
  end
end
