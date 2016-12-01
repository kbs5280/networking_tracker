require 'rails_helper'

describe 'User can log in', type: :feature do
  scenario 'user clicks Login and sees login form' do
    visit root_path

    click_on 'Log in'

    expect(current_path).to eq login_path

    find_field 'session[username]'
    find_field 'session[password]'

    expect(page).to have_button 'Login'
  end

  scenario 'user logs in and is redirected to root path' do
    user = User.create(username: 'Username', password: 'password', password_confirmation: 'password')

    visit login_path

    fill_in 'Username', with: 'Username'
    fill_in 'Password', with: 'password'
    click_button 'Login'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Login successful!'
    expect(page).to have_content 'Welcome, Username'
    expect(page).to have_content 'Logout'
    expect(page).not_to have_link 'Login'
    expect(page).not_to have_link 'Sign up'
  end
end
