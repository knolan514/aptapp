require 'rails_helper'

RSpec.feature "AptShowPages", type: :feature do
  context 'I can create a new apt and see its location on a map' do
    Steps 'Add apartment' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can add a new apartment' do
        click_link 'New Apartment'
        fill_in 'apartment[address1]', with: '15064 Avenida Montuosa'
        fill_in 'apartment_address2', with: 'Apt D'
        fill_in 'City', with: 'San Diego'
        fill_in 'apartment[postal_code]', with: '92129'
        fill_in 'apartment[state]', with: 'CA'
        fill_in 'apartment[country]', with: 'USA'
        fill_in 'apartment[owner_name]', with: 'The Hills'
        fill_in 'apartment[contact_time]', with: 'Monday - Saturday 9-6, Sunday 12-5'
        fill_in 'apartment[owner_phone]', with: '213-555-1212'
        click_button 'Create Apartment'
      end
      Then 'I can see a map with this apt on the show page' do
        visit '/apartments/'
        click_link 'Show'
        expect(page).to have_content('15064 Avenida Montuosa')
        expect(page).to have_content('Apt D')
        expect(page).to have_content('San Diego')
        expect(page).to have_content('92129')
        expect(page).to have_content('CA')
        expect(page).to have_content('USA')
        expect(page).to have_content('32.989111')
        expect(page).to have_content('-117.0897417')
        expect(page.find_by_id('map')).to_not eq nil
      end
    end
  end
end
