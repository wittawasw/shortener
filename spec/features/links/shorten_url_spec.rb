require 'rails_helper'

feature 'Shorten URL', js: true do

  fixtures :links

  let(:google_link) { links(:google_link) }
  let(:last_link)   { links(:last_link) }

  scenario 'Load shortened URLs' do
    visit links_path
    
    expect(page).to have_content google_link.slug
    expect(page).to have_content 'next »'
  end

  scenario 'Load next shortened URLs' do
    visit links_path
    click_link 'next »'
    
    expect(page).to have_content 'https://'
    expect(page).to have_content '« prev'
  end

  scenario 'Load prev shortened URLs' do
    visit links_path
    click_link 'next »'
    click_link '« prev'

    expect(page).to have_content google_link.slug
    expect(page).to have_content "next »"
  end

  scenario 'Shorten URL and show result immediately' do
    visit links_path
    within('.form-horizontal') do
      fill_in 'link[origin]', with: 'facebook.com'
      click_button 'SHORTEN'
    end

    expect(page).to have_content 'facebook.com'
  end

  scenario 'Shorten URL in later page and show result immediately after back to first page' do
    visit links_path
    click_link 'next »'

    expect(page).to have_content '« prev'

    within('.form-horizontal') do
      fill_in 'link[origin]', with: 'facebook.com'
      click_button 'SHORTEN'
    end

    expect(page).to have_content 'facebook.com'
    expect(page).to have_content 'next »'
  end

end
