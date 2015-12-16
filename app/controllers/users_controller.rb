class UsersController < ApplicationController

  def index
    @service = WitterService.new(current_user)
  end

  def show
    @service = WitterService.new(current_user)
  end
end
