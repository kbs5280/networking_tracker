require 'rails_helper'

describe 'User can create contact', type: :feature do
  scenario 'and views contact on root page' do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_content 'New contact'

    find_field 'contact[first_name]'
    find_field 'contact[last_name]'
    find_field 'contact[email]'
    find_field 'contact[phone]'
    find_field 'contact[linked_in]'
    find_field 'contact[twitter]'
    find_field 'contact[other]'

    expect(page).to have_button 'Create contact'
  end
end
