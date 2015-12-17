class WitterService
  attr_reader :client, :user

  def initialize(user)
    @user = user
    @client ||= Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['TWITTER_KEY']
    config.consumer_secret     = ENV['TWITTER_SECRET']
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

  def create_tweet(content)
    client.update(content)
  end

  def followers
   client.followers
  end

  def friends
   client.friends
  end

  def tweets
   client.user_timeline
  end

  def favorite(tweet_id)
  client.favorite(tweet_id)
  end
end
