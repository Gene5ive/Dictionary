require('capybara/rspec')
require('./app')
require('pry')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('paths for word-index page', {:type => :feature}) do
  it('links user to word-form page page') do
    visit('/')
    find(:xpath, "//a[@href='/words/new']").click
    expect(page).to have_content('Add Word')
  end
end
