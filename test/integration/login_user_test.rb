require 'test_helper'

class UserCanLoginTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = Witter::application
    stub_omniauth
  end

  test 'user_can_login' do
    
