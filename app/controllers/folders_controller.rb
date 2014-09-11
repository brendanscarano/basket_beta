class FoldersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_folder, only: [:show, :destroy]
  respond_to :html, :js

  def show
    @new_folder = Folder.new
    @links = @folder.links.order('created_at DESC')
  end

  def new
    @new_folder = Folder.new
  end

  def create
    @folder = Folder.new(folder_params)
    @folder.user_id = current_user.id

    if @folder.save
      flash.now[:success] = "Request submitted successfully."
    else
      flash.now[:error] = "There was a problem submitting your request."
    end

    respond_with(@folder)
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