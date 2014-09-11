class UsersController < ApplicationController
  def users_friends
    render partial: "friends"
  end
end