require './test/test_helper'

class WitterServiceTest < ActiveSupport::TestCase

  attr_reader :service

  def setup
    user = OpenStruct.new(oauth_token: ENV["oauth_token"], oauth_token_secret: ENV["oauth_token_secret"])
    @service = WitterService.new(user)
  end

  test "#user_timeline" do
    VCR.use_cassette("witter_service#user_timeline") do
    user_timeline = service.user_timeline
    tweet = user_timeline.first

    assert_equal 20, user_timeline.count
    assert_equal "Joni", tweet[:tweet]
    end
  end


end
