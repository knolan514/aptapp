require 'rails_helper'

RSpec.feature "UserPages", type: :feature do
  context 'I can create a new user' do
    Steps 'Add user' do
      Given 'I am on the sign up page' do
        visit '/users/sign_up'
      end
      Then 'I click add user' do
        fill_in 'user[email]', with: 'jramon@gmail.com'
        fill_in 'user[password]', with: 'Iamthebest!'
        fill_in 'user[password_confirmation]', with: 'Iamthebest!'
        click_button 'Sign up'
        expect(page).to have_content('Welcome! You have signed up successfully.')

      end
    end
  end
end
