class TweetsController < ApplicationController

  def create
    WitterService.new(current_user).
  end
end
