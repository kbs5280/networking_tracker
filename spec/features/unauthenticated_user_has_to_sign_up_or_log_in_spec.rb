require 'rails_helper'

describe 'Unathenticated user has to sign up or log in', type: :feature do
  scenario 'and is redirected to the the home page' do
    visit root_path

    expect(current_path).to eq home_path
    expect(page).to have_link 'Sign up'
    expect(page).to have_link 'Log in'
  end

  scenario 'and clicks sign up and sees sign up form' do
    visit home_path

    click_on 'Sign up'

    expect(current_path).to eq new_user_path
    expect(page).to have_content 'Sign up'
    expect(page).to have_button 'Create account'
  end

  scenario 'and clicks log in and sees log in form' do
    visit home_path

    click_on 'Log in'

    expect(current_path).to eq login_path
    expect(page).to have_content 'Log in'
    expect(page).to have_button 'Login'
  end
end
