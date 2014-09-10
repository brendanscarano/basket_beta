class LinksController < ApplicationController
  respond_to :js

  skip_before_filter  :verify_authenticity_token

  def new_link
    link = Link.find_by_url(params["url"])

    if link == nil 
      link = Link.create(url: params["url"],
                        title: params["pageInfo"]["title"],
                        description: params["pageInfo"]["description"],
                        image: params["pageInfo"]["image"])
    end

    FolderLink.create(link_id: link.id,
                        folder_id: params["uniqueId"])
    redirect_to root_url
  end

  
  def destroy
    folder = Folder.find(params[:folder_id])

    link_dependencies = FolderLink.where(link_id: params[:id]) # []
    
    if link_dependencies.length == 1
      @link = Link.find(params[:id]).destroy
      folder_link = FolderLink.where(link_id: params[:id],
                                      folder_id: params[:folder_id])
      folder_link[0].destroy
    else
      folder_link = FolderLink.where(link_id: params[:id],
                                      folder_id: params[:folder_id])
      folder_link[0].destroy
    end

    respond_with(@link)
  end

end