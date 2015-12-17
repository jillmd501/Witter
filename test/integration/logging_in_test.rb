require 'test_helper'

class UserLogsInTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app=Witter::Application
    stub_omniauth
  end

  test 'user can login' do
    VCR.use_cassette("witter_service#allofit") do
      visit root_path
      click_on "Login"

      assert page.has_content?("Horace")

      click_on "Home"

      assert_page.has_content?("Homefeed")
    end
  end
end
