class UsersController < ApplicationController
  def users_friends
    render partial: "friends"
  end

  def about
    @new_folder = Folder.new
  end
end