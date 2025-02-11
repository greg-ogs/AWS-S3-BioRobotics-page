require "capybara/rspec"
require "selenium-webdriver"

# Configure Capybara to use Selenium and point to your local server.
Capybara.default_driver = :selenium_chrome
Capybara.run_server = false
Capybara.app_host = "http://localhost:8080"

RSpec.describe "Page Rendering", type: :feature do
  it "displays the correct heading" do
    visit("/")
    expect(page).to have_content("Docker container flask app test")
  end
end