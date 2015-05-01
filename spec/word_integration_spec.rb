require('capybara/rspec')
require('./app')
require('pry')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('path through index >>
                    word_form >>
                    success >>
                    index >>
                    word >>
                    definition_form >>
                    success
                    ', {:type => :feature}) do
  it('links user to word-form page page') do
    visit('/')
    find(:xpath, "//a[@href='/words/new']").click
    expect(page).to have_content('Add Word')
  end

  it('allows user to input word information and links user to success page') do
    visit('/words/new')
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

  it('links user to definition-form page') do
    visit('/words/:id')
    click_link('Add Definitions')
    expect(page).to have_content('Add a definition to "small"')
  end

  it('allows user to input definition information and links user to success page') do
    visit('/words/:id/definitions/new')
    fill_in('Definition', with: "little")
    click_button('Add Definition')
    expect(page).to have_content('Success!')
  end
end
