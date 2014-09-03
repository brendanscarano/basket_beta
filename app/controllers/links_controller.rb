class LinksController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def new_link
    binding.pry
    #Should be find or create, to not duplicate urls in the database
    #include the new info being sent in from the extension
    link = Link.find_by_url(params["url"]).first_or_create

    if link == nil 
      link = Link.create(url: params["url"],
                        title:,
                        description:,
                        image: )
    end
    
    FolderLink.create(link_id: link.id,
                        folder_id: params["basketId"])
    redirect_to root_url
  end

end