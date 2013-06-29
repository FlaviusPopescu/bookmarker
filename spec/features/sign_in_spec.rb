require 'spec_helper'

feature 'User signs in' do

  let(:user) { Fabricate :user, password: 'secret', email: 'test@dragon.com' }

  scenario 'with proper credentials' do
    visit root_path
    fill_in :email, with: user.email
    fill_in :password, with: 'secret'
    click_button 'Sign in'

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
