class FoldersController < ApplicationController
  def index
    @folders = UserFolder.where(user_id: current_user.id)
  end

  def show
    @folder = Folder.find(params[:id])
  end

  def new
    @folder = Folder.new
  end

  def create
    @folder = Folder.new(folder_params)

    if @folder.save
      UserFolder.create(user_id: current_user.id, folder_id: @folder.id)
      flash[:notice] = "Folder has been created."
    end
  end

  private

  def folder_params
    params.require(:folder).permit(:name)
  end
end