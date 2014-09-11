class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id

    SharedBasket.where(user_id: user.id).first_or_create
    Folder.where(name: "Read Later", user_id: user.id).first_or_create
    Folder.where(name: "Funny Links", user_id: user.id).first_or_create
    Folder.where(name: "New Music", user_id: user.id).first_or_create
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end