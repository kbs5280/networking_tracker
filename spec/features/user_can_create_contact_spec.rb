require 'rails_helper'

describe 'User can create contact', type: :feature do
  scenario 'user views contact form on root page' do
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

  scenario 'and views contact on root page' do
    user = create(:user)
    contact = create(:contact, user_id: user.id, first_name: 'Alan', last_name: 'Turing', email: 'alan@alan.com', phone: '7205555555', linked_in: 'alan', twitter: 'turing', other: 'other')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_content 'New contact'

    fill_in 'First name', with: contact.first_name
    fill_in 'Last name', with: contact.last_name
    fill_in 'Email', with: contact.email
    fill_in 'Phone', with: contact.phone
    fill_in 'LinkedIn', with: contact.linked_in
    fill_in 'Twitter', with: contact.twitter
    fill_in 'Other', with: contact.other
    click_on 'Create contact'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Alan'
    expect(page).to have_content 'Turing'
    expect(page).to have_content 'alan@alan.com'
    expect(page).to have_content '7205555555'
    expect(page).to have_content 'alan'
    expect(page).to have_content 'turing'
  end
end
