require('capybara/rspec')
require('./app')
require('pry')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('paths from index >> word_form >> success >> index >> word', {:type => :feature}) do
  it('links user to word-form page page') do
    visit('/')
    find(:xpath, "//a[@href='/word/new']").click
    expect(page).to have_content('Add Word')
  end

  it('links user to success page') do
    visit('/word/new')
    fill_in('word', with: "small")
    fill_in('language', with: "English")
    fill_in('origin', with: "Europe")
    click_button('Add Word')
    expect(page).to have_content('Success!')
  end

  it('links user to index page') do
    visit('/success')
    click_link("Back to Main Page")
    expect(page).to have_content('My Dictionary')
  end

  it('links user to word page') do
    visit('/')
    click_link("small")
    expect(page).to have_content('Here is all the information on the word "small"')
  end
end
