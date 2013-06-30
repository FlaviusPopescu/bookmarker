require 'spec_helper'

feature 'User signs in' do

  scenario 'with proper credentials' do
    sign_in

    expect(page).to have_content('Sign out')
  end

  scenario 'withotuh proper credentials' do
    visit sign_in_path
    fill_in :email, with: 'idontexist@yahoo.com'
    fill_in :password, with: 'vacum'
    click_button 'Sign in'

    expect(page).to have_content('combination does not match')
  end

end
