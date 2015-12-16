class TweetsController < ApplicationController
  def create
    WitterService.new(current_user).create_tweet(params["Tweet"]["tweet"])
    sleep(2)
    redirect_to :back
  end

  def favorite
    WitterService.new(current_user).favorite(params["id"].to_i)
    sleep(2)
    redirect_to :back
  end
end
