class LinksController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def new_link
    link = Link.create(url: params["url"])
    Folder_Link.create(link_id: link.id,
                        folder_id: params["basketId"])
    redirect_to root_url
  end

end