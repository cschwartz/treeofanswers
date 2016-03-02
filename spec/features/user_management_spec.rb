require 'rails_helper'

RSpec.describe 'User management', type: :feature do
  it 'new user' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'alice@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_css '.notice', 'Welcome! You have signed up successfully.'
  end

  describe 'login' do
    it 'existing user' do
      create(:user)

      visit '/'
      click_link 'Log in'
      fill_in 'Email', with: 'alice@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      expect(page).to have_link 'Log out'
    end

    it 'not existing user' do
      visit '/'
      click_link 'Log in'
      fill_in 'Email', with: 'eve@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      expect(page).to have_css '.alert', 'Invalid email or password.'
    end
  end
end
