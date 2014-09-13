class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id

    if SharedBasket.where(user_id: user.id).first == nil
      SharedBasket.where(user_id: user.id).create
      Folder.where(name: "Save For Later", user_id: user.id).first_or_create
    else
      SharedBasket.where(user_id: user.id).first
    end

    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end