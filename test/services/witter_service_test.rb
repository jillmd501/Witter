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

 test "#all_tweets" do
   VCR.use_cassette("witter_service#all_tweets") do
     tweets = service.home_timeline
     tweet = tweets.first

     assert_equal 20, tweets.count
     assert tweet[:text]
   end
  end

 test "#followers" do
   VCR.use_cassette("witter_service#followers") do
     total = service.followers

     assert_equal 175, total.count
   end
  end

 test "#friends" do
   VCR.use_cassette("witter_service#friends") do
     total = service.friends

     assert_equal 191, total.count
   end
  end

  test "#tweets" do
    VCR.use_cassette("witter_service#tweets") do
      tweets = service.user_timeline
      tweet = tweets.first

      assert_equal 20, tweets.count
      assert tweet[:text]
    end
  end

end
