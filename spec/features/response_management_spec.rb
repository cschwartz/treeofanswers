require 'rails_helper'

RSpec.describe 'New response', type: :feature do
  let!(:alice) { create :user }
  let!(:bob) { create :user, email: 'bob@example.net' }
  let!(:charlene) { create :user, email: 'charlene@example.net' }
  let!(:david) { create :user, email: 'david@example.net' }
  let!(:eve) { create :user, email: 'eve@example.net' }

  before(:each) do
    log_in_as alice
    create_request 'My description', ['bob@example.net', 'charlene@example.net']
    switch_user_to bob
  end

  describe 'answer a request' do
    before :each do
      visit '/'
      click_link 'Responses'
      click_link 'My description'

      fill_in 'Description', with: 'A really useful answer'
      click_button 'Update Response'
    end

    it 'creates the response' do
      expect(page).to have_content 'Response successfully created'
    end

    it 'shows the answer for the response', js: true do
      select_response_by bob

      expect(page).to have_css '#response', text: 'A really useful answer'
    end
  end

  describe 'delegate a request' do
    before :each do
      visit '/'
      click_link 'Responses'
      click_link 'My description'

      click_link 'Add respondent'
      all(:css, ".response .email").first.fill_in('Email', with: 'david@example.net')

      click_link 'Add respondent'
      all(:css, ".response .email").last.fill_in 'Email', with: 'eve@example.net'

      click_button 'Update Response'
    end

    it 'creates the response', js: true do
      expect(page).to have_content 'Response successfully created'
    end

    it 'shows the users delegated to', js: true do
      expand_response_node_of bob

      expect(page).to have_css '#request-tree li', text: 'david@example.net'
      expect(page).to have_css '#request-tree li', text: 'eve@example.net'
    end

    it 'shows up for the user delegated to', js: true do
      switch_user_to david

      click_link 'Responses'
      click_link 'My description'

      expect(page).to have_content 'My description'
    end
  end

  def expand_response_node_of user
    find(:xpath, "//li[contains(., '#{user.email}')]").find(:css, '.expand-icon').click
  end

  def select_response_by(user)
    page.find(:xpath,"//*[text()='#{user.email}']").click
  end
end
