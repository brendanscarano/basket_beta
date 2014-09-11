class FolderLinksController < ApplicationController
  respond_to :js

  def destroy
    folder = Folder.find(params[:folder_id])

    @folder_link = FolderLink.where(link_id: params[:id],
                                    folder_id: params[:folder_id])[0]
    @folder_link.destroy
    # link_dependencies = FolderLink.where(link_id: params[:id]) # []
    
    # if link_dependencies.length == 1
    #   @link = Link.find(params[:id]).destroy
    #   folder_link = FolderLink.where(link_id: params[:id],
    #                                   folder_id: params[:folder_id])
    #   folder_link[0].destroy
    # else
    #   folder_link = FolderLink.where(link_id: params[:id],
    #                                   folder_id: params[:folder_id])
    #   folder_link[0].destroy
    # end

    respond_with(@folder_link)
  end

end