ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'webmock'
require 'vcr'
require 'simplecov'
require 'capybara'
require 'minitest/pride'
require 'vcr'

SimpleCov.start("rails")

include Capybara::DSL


class ActiveSupport::TestCase
  fixtures :all

  VCR.configure do |config|
    config.cassette_library_dir = "test/cassettes"
    config.hook_into :webmock
  end

def stub_omniauth
    # first, set OmniAuth to run in test mode
    OmniAuth.config.test_mode = true
    # then, provide a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
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
