require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do
  context 'Going to website' do
    Steps 'Being welcomed' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can see a welcome message' do
        expect(page).to have_content('Welcome to Apartment Finder!')
      end
    end
  end

  context 'I can add an apartment' do
    Steps 'Add apartment' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can add a new apartment' do
        click_link 'New Apartment'
        fill_in 'apartment[address1]', with: '3803 Ray St.'
        fill_in 'apartment_address2', with: 'Suite B'
        fill_in 'City', with: 'San Diego'
        fill_in 'apartment[postal_code]', with: '92104'
        fill_in 'apartment[state]', with: 'CA'
        fill_in 'apartment[country]', with: 'USA'
        fill_in 'apartment[owner_name]', with: 'Colin Farrell'
        fill_in 'apartment[contact_time]', with: 'Call me anytime!'
        fill_in 'apartment[owner_phone]', with: '213-555-1212'
        attach_file "apartment[image]", "spec/assets/apt.jpeg"
        click_button 'Create Apartment'
      end
      Then 'I can see the apartment was created' do
        expect(page).to have_content('Apartment was successfully created.')
        expect(page).to have_content('3803 Ray St.')
        expect(page).to have_content('Suite B')
        expect(page).to have_content('San Diego')
        expect(page).to have_content('92104')
        expect(page).to have_content('CA')
        expect(page).to have_content('USA')
        expect(page).to have_content('Colin Farrell')
        expect(page).to have_content('Call me anytime!')
        expect(page).to have_content('213-555-1212')
      end
    end
  end
  context 'I can see a list of apartments on the home page' do
    Steps 'Add apartment' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can add a new apartment' do
        click_link 'New Apartment'
        fill_in 'apartment[address1]', with: '3803 Ray St.'
        fill_in 'apartment_address2', with: 'Suite B'
        fill_in 'City', with: 'San Diego'
        fill_in 'apartment[postal_code]', with: '92104'
        fill_in 'apartment[state]', with: 'CA'
        fill_in 'apartment[country]', with: 'USA'
        fill_in 'apartment[owner_name]', with: 'Colin Farrell'
        fill_in 'apartment[contact_time]', with: 'Call me anytime!'
        fill_in 'apartment[owner_phone]', with: '213-555-1212'
        attach_file "apartment[image]", "spec/assets/apt.jpeg"
        click_button 'Create Apartment'
      end
      Then 'I can see a list of apartments on the home page' do
        visit '/'
        expect(page).to have_content('3803 Ray St.')
        expect(page).to have_content('Suite B')
        expect(page).to have_content('San Diego')
        expect(page).to have_content('92104')
        expect(page).to have_content('CA')
        expect(page).to have_content('USA')
        expect(page).to have_content('Colin Farrell')
        expect(page).to have_content('Call me anytime!')
        expect(page).to have_content('213-555-1212')
      end
    end
  end

  context 'I can add an image of my apartment to the listing' do
    Steps 'Add apartment' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can add a new apartment with photo' do
        click_link 'New Apartment'
        fill_in 'apartment[address1]', with: '3803 Ray St.'
        fill_in 'apartment_address2', with: 'Suite B'
        fill_in 'City', with: 'San Diego'
        fill_in 'apartment[postal_code]', with: '92104'
        fill_in 'apartment[state]', with: 'CA'
        fill_in 'apartment[country]', with: 'USA'
        fill_in 'apartment[owner_name]', with: 'Colin Farrell'
        fill_in 'apartment[contact_time]', with: 'Call me anytime!'
        fill_in 'apartment[owner_phone]', with: '213-555-1212'
        attach_file "apartment[image]", "spec/assets/apt.jpeg"
        click_button 'Create Apartment'
        expect(page).to have_selector('img')
      end
    end
  end
end
