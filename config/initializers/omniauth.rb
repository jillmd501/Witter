Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["PROD_TWITTER_KEY"], ENV["PROD_TWITTER_SECRET"]
end
