require 'rails_helper'

describe 'User can log in', type: :feature do
  scenario 'user clicks Login and sees login form' do
    visit root_path

    click_on 'Login'

    expect(current_path).to eq login_path

    find_field 'session[username]'
    find_field 'session[password]'

    expect(page).to have_button 'Login'
  end
end
