class LinksController < ApplicationController
  respond_to :js

  skip_before_filter  :verify_authentici ty_token

  def new_link
    # link = Link.find_by_url(params["url"])

    # if link == nil 
    link = Link.create(url: params["url"],
                      title: params["pageInfo"]["title"],
                      message: params["message"],
                      description: params["pageInfo"]["description"],
                      image: params["pageInfo"]["image"])
    # end

    FolderLink.create(link_id: link.id,
                        folder_id: params["uniqueId"])
    redirect_to root_url
  end

end