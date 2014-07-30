class FoldersController < ApplicationController
  # def index
  #   @folders = UserFolder.where(user_id: current_user.id)
  # end
  skip_before_action :verify_authenticity_token

  def show
    @folder = Folder.find(params[:id])
  end

  def new
    @folder = Folder.new
  end

  def create

    @folder = Folder.new(name: params["folder_name"])

    if @folder.save
      UserFolder.create(user_id: current_user.id, folder_id: @folder.id)
      flash[:notice] = "Folder has been created."

    render partial: 'userfolders'

    # respond_to do |format|
    #   format.json {
    #     @folder = Folder.new(name: params["folder_name"])

    #     if @folder.save
    #       UserFolder.create(user_id: current_user.id, folder_id: @folder.id)
    #       flash[:notice] = "Folder has been created."
          
    #       {folder_name: @folder.name}.to_json
    #       redirect_to @folder
    #     end

    #   }

    #   format.html {
    #     if @folder.save
    #       UserFolder.create(user_id: current_user.id, folder_id: @folder.id)
    #       flash[:notice] = "Folder has been created."
    #     end
    #   }
    end
  end

  private

  def folder_params
    params.require(:folder).permit(:name)
  end
end