require 'test_helper'

class TweetsControllerTest < ActionController::TestCase

  test "should create" do
    request.env["HTTP_REFERER"] = users_path
    user = OpenStruct.new(oauth_token: ENV["oauth_token"], oauth_token_secret: ENV["oauth_token_secret"])
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    VCR.use_cassette("witter_service#create_tweet") do
      params = { "Tweet" => {"tweet" => "hello"} }
      post :create, params

      assert_response :success
    end
  end

  test "should favorite" do
    request.env["HTTP_REFERER"] = users_path
    user = OpenStruct.new(oauth_token: ENV["oauth_token"], oauth_token_secret: ENV["oauth_token_secret"])
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    VCR.use_cassette("witter_service#favorite_tweet") do
      params = { "Tweet" => {"tweet" => "hello"} }
      post :create, params

      assert_response :success
    end
  end
end
