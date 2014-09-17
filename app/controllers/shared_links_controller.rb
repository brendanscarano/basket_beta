class SharedLinksController < ApplicationController
  respond_to :js
  skip_before_filter  :verify_authenticity_token

  def destroy
    @shared_link = SharedLink.find(params[:id])
    @shared_link.destroy
    respond_with(@shared_link)
  end

  def sent_link
    friend_id = params["uniqueId"].to_i
    shared_basket = SharedBasket.find(friend_id)

    #include the new info being sent in from the extension
    shared_basket.shared_links.create(sender_id: current_user.id,
                                      url: params["url"],
                                      message: params["message"],
                                      title: params["pageInfo"]["title"],
                                      description: params["pageInfo"]["description"],
                                      image: params["pageInfo"]["image"])
    redirect_to root_url
  end

end