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

      it "shows the email of the respondents", js: true do
        expect(page).to have_content 'bob@example.net'
        expect(page).to have_content 'charlene@example.net'
      end
    end
  end

  describe 'index' do
    before(:each) do
      log_in_as alice
    end

    let!(:first_request) { create :request, user: alice, description: 'My description', respondents: [bob, charlene] }
    let!(:second_request) { create :request, user: alice, description: 'My other description', respondents: [bob, charlene] }

    it 'shows all requests on my requests page' do
      click_link 'Requests'

      expect(page).to have_link "My description", href: request_path(first_request)
      expect(page).to have_link "My other description", href: request_path(second_request)
    end

    it 'shows required responses on the respondents responses page' do
      switch_user_to bob

      click_link 'Responses'
      click_link 'My description'

      expect(page).to have_content 'My description'
    end
  end
end
