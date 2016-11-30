require 'rails_helper'

describe 'User can see home page', type: :feature do
  scenario 'when visiting root' do
    visit root_path

    expect(page).to have_content 'Networking Tracker'
    expect(page).to have_link 'Login'
    expect(page).to have_link 'Sign up'
  end
end
