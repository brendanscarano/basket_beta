class LinksController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def destroy
    folder = Folder.find(params[:folder_id])

    link_dependencies = FolderLink.where(link_id: params[:id])
    if link_dependencies == 1
      Link.find(params[:id]).destroy
      redirect_to folder_path(folder)
    else
      folder_link = FolderLink.where(link_id: params[:id],
                                      folder_id: params[:folder_id])
      folder_link[0].destroy
    end

    redirect_to folder_path(folder)
  end

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

end