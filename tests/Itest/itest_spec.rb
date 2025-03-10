require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'
include Capybara::DSL

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :remote,
    url: 'http://selenium:4444/wd/hub',
    options: Selenium::WebDriver::Chrome::Options.new.tap do |opts|
      opts.args = %w[
        --no-default-browser-check
        --disable-gpu
        --disable-shm
        --no-sandbox
        --window-size=1920x1080
      ]
    end
  )
end
Capybara.default_driver = :selenium

raise "Set env variable for web url (WEBSITE_URL)" if ENV['WEBSITE_URL'].nil?
describe '"Integration" test for aws s3' do
  it 'Should be able to load the index page' do
    visit(ENV['WEBSITE_URL'])
    expect(page).to have_current_path(ENV['WEBSITE_URL'])
    expect(page).to have_content('Robotics')
    expect(page).to have_selector('h1', text: 'BioRobotics Research')
  end
end