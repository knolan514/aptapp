require 'rails_helper'

RSpec.feature "UserPages", type: :feature do
  context 'I can create a new user' do
    Steps 'Add user' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I click add user' do
        click_link 'New User'
        fill_in 'user[name]', with: 'Johnny Ramon'
        fill_in 'user[email]', with: 'jramon@gmail.com'
        click_button 'Create User'
        expect(page).to have_content('User was successfully created.')
        expect(page).to have_content('Johnny Ramon')
        expect(page).to have_content('jramon@gmail.com')
      end
    end
  end
end
