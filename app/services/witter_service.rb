class WitterService
  attr_reader :client, :user

  def initialize(user)
    @user = user
    @client ||= Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['PROD_TWITTER_KEY']
    config.consumer_secret     = ENV['PROD_TWITTER_SECRET']
    config.access_token        = user.oauth_token
    config.access_token_secret = user.oauth_token_secret
    end
  end

  def user_timeline
    client.user_timeline
  end

  def home_timeline
    client.home_timeline
  end

  def followers
   user.followers_count
 end

 def friends
   user.friends_count
 end

 def tweet_count
   user.tweets_count
 end
end
