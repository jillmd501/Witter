class UsersController < ApplicationController

  def index
    @service = WitterService.new(current_user)
    @tweet = "Tweet"
  end

  def show
    @service = WitterService.new(current_user)
    @tweet = "Tweet"
  end
end
