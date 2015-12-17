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
require 'mocha/mini_test'

SimpleCov.start("rails")

class ActiveSupport::TestCase
  fixtures :all

  VCR.configure do |config|
    config.allow_http_connections_when_no_cassette = true
    config.cassette_library_dir = "test/cassettes"
    config.hook_into :webmock
  end

  include Capybara::DSL

  def stub_omniauth
      OmniAuth.config.test_mode = true
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
          token: ENV["oauth_token"],
          secret: ENV["oauth_token_secret"]
        }
      })
    end
  end
