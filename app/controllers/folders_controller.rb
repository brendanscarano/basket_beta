class FoldersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_folder, only: [:show, :destroy]

  def show
    folder = Folder.find(params[:id])
    @links = folder.links
  end

  def new
    @folder = Folder.new
  end

  def create
    @folder = Folder.new(name: params["folder_name"])

    if @folder.save
      UserFolder.create(user_id: current_user.id, folder_id: @folder.id)
      flash[:notice] = "Folder has been created."

      redirect_to root_url
    end
  end

  def destroy
    @folder.destroy

    render partial: 'userfolders'
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