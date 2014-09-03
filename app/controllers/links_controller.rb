class LinksController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def new_link
    #Should be find or create, to not duplicate urls in the database
    link = Link.create(url: params["url"])

    #include the new info being sent in from the extension
    FolderLink.create(link_id: link.id,
                        folder_id: params["basketId"])
    redirect_to root_url
  end

end