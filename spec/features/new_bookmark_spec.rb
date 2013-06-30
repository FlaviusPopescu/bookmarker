require 'spec_helper'

feature 'Bookmark creation' do

  scenario 'user creates new bookmark' do
    sign_in
    visit new_bookmark_path
    fill_in :new_bookmark, with: 'http://morningstar.com'
    click_button 'Create Bookmark'

    expect(page).to have_content('morningstar.com')
  end

end
