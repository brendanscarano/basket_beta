class FolderLinksController < ApplicationController
  respond_to :js

  def destroy
    folder = Folder.find(params[:folder_id])

    @folder_link = FolderLink.where(link_id: params[:id],
                                    folder_id: params[:folder_id])[0]
    @folder_link.destroy

    respond_with(@folder_link)
  end

end