class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    folder = Folder.find_or_create_by_user_id_and_name(user_id: user.id, name: "Shared")

    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end