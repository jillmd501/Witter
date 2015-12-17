require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def auth_info
  OmniAuth::AuthHash.new({
    'uid' => '123456', 'extra' => {'raw_info' => { 'name' => 'Jill', 'screen_name' => 'jill' }}, 'credentials' => {'token' => '67', 'secret' => '87'}})
  end
  
  test 'user can be saved' do
    User.from_omniauth(auth_info)
    user = User.last

    assert_equal '123456', user.uid
    assert_equal 'Jill', user.name
    assert_equal 'jill', user.screen_name
    assert_equal '67', user.oauth_token
    assert_equal '87', user.oauth_token_secret
  end
end
