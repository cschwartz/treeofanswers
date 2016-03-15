module Helpers
  def log_in_as(user)
    visit '/'

    click_link 'Log in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end

  def switch_user_to(user)
    visit '/'
    click_link 'Log out'
    log_in_as user
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
