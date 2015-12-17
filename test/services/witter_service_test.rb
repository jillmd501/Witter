require './test/test_helper'

class WitterServiceTest < ActiveSupport::TestCase

  attr_reader :service

  def setup
   user = OpenStruct.new(oauth_token: ENV["oauth_token"], oauth_token_secret: ENV["oauth_token_secret"])
   @service = WitterService.new(user)
 end

 test "#my_tweets" do
   VCR.use_cassette("witter_service#my_tweets") do
     tweets = service.user_timeline
     tweet = tweets.first

     assert_equal 20, tweets.count
     assert tweet[:text]
   end
  end
end
