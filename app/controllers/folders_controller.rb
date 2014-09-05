class FoldersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_folder, only: [:show, :destroy]

  def show
    folder = Folder.find(params[:id])
    @links = folder.links.order('created_at DESC')
  end

  def new
    @folder = Folder.new
  end

  def create
    user = current_user
    folder = Folder.new(name: params["folder_name"], user_id: user.id)

    if folder.save
      flash[:notice] = "Folder has been created."
    end

    redirect_to folder_path(folder)
  end

  def destroy
    Folder.find(params[:id]).destroy
    FolderLink.where(folder_id: params[:id]).delete_all

    redirect_to root_url
  end

  def users_folders
    user = User.find(current_user.id)

    @folders = user.folders
    render partial: "folders"
    # render :json => { @folders }
  end

  private

  def folder_params
    params.require(:folder).permit(:name)
  end

  def set_folder
    @folder = Folder.find(params[:id])
  end
end