require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the user path', {:type => :feature}) do
  it('processes the user entry and returns item based on id') do
    visit('/')
    fill_in('name', :with => 'snail')
    click_button('Go!')
    expect(page).to have_content('snail')
  end
end
