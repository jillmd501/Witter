require "test_helper"
class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  # def setup
  #   Capybara.app = Witter::Application
  #   stub_omniauth
  # end

  test "logging in" do
    skip
    visit "/"
    assert_equal 200, page.status_code
    click_link "login"
    assert_equal "/", current_path
    assert page.has_content?("Horace")
    assert page.has_link?("logout")
  end

  def stub_omniauth
    Witter.config.test_mode = true
    Witter.config.mock_auth[:twitter] = Witter::AuthHash.new({
      provider: 'twitter',
      extra: {
        raw_info: {
          user_id: "1234",
          name: "Horace",
          screen_name: "worace",
        }
      },
      credentials: {
        token: "pizza",
        secret: "secretpizza"
      }
    })
  end
end
