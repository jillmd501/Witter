class TweetsController < ApplicationController

  def create
    WitterService.new(current_user).create_tweet(params[:message])
  end
end
