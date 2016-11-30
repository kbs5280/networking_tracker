require 'rails_helper'

describe 'User can sign up', type: :feature do
  scenario 'and sees form to sign up' do
    visit root_path

    click_on 'Sign up'

    expect(current_path).to eq new_user_path

    find_field 'user[username]'
    find_field 'user[password]'
    find_field 'user[password_confirmation]'

    expect(page).to have_content 'Sign up'
    expect(page).to have_button 'Create account'
  end
  
  scenario 'and is redirected to the root path' do
    visit new_user_path

    fill_in 'Username', with: 'Username'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm password', with: 'password'
    click_on 'Create account'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Account created'
    expect(page).to have_content 'Welcome, Username'
    expect(page).to have_content 'Logout'
    expect(page).not_to have_content 'Login'
    expect(page).not_to have_content 'Sign up'
  end
end
