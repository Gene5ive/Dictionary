require('capybara/rspec')
require('./app')
require('pry')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('paths for word-index page', {:type => :feature}) do
  it('links user to word-form page page') do
    visit('/')
    find(:xpath, "//a[@href='/word/new']").click
    expect(page).to have_content('Add Word')
  end

  it('links user to word-definition page') do
    visit('/word/new')
    fill_in('word', with: "small")
    fill_in('language', with: "English")
    fill_in('origin', with: "Europe")
    click_button('Add Word')
    expect(page).to have_content('Success!')
  end
end
