require 'rails_helper'

describe 'User can create contact', type: :feature do
  scenario 'user views contact form on root page' do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_content 'New contact'

    expect(page).to have_field('First Name')
    expect(page).to have_field('Last Name')
    expect(page).to have_field('Email')
    expect(page).to have_field('Phone')
    expect(page).to have_field('LinkedIn')
    expect(page).to have_field('Twitter')
    expect(page).to have_field('Other')

    expect(page).to have_button 'Create contact'
  end

  # scenario 'and views contact on root page' do
  #   user = create(:user)
  #   contact = create(
  #     :contact,
  #     user_id: user.id,
  #     first_name: 'Alan',
  #     last_name: 'Turing',
  #     email: 'alan@alan.com',
  #     phone: '7205555555',
  #     linked_in: 'alan',
  #     twitter: 'turing',
  #     other: 'other'
  #   )
  #
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  #
  #   visit root_path
  #
  #   expect(page).to have_content 'New contact'
  #
  #   fill_in 'First name', with: contact.first_name
  #   fill_in 'Last name', with: contact.last_name
  #   fill_in 'Email', with: contact.email
  #   fill_in 'Phone', with: contact.phone
  #   fill_in 'LinkedIn', with: contact.linked_in
  #   fill_in 'Twitter', with: contact.twitter
  #   fill_in 'Other', with: contact.other
  #   click_on 'Create contact'
  #
  #   expect(current_path).to eq root_path
  #   expect(page).to have_content 'Alan'
  #   expect(page).to have_content 'Turing'
  #   expect(page).to have_content 'alan@alan.com'
  #   expect(page).to have_content '7205555555'
  #   expect(page).to have_content 'alan'
  #   expect(page).to have_content 'turing'
  # end
end
