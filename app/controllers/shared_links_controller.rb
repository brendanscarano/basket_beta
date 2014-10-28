class SharedLinksController < ApplicationController
  respond_to :js
  skip_before_filter  :verify_authenticity_token

  def destroy
    @shared_link = SharedLink.find(params[:id])
    @shared_link.destroy
    respond_with(@shared_link)
  end

  def inbox_links
    @return_links = []
    shared_basket = SharedBasket.find_by_user_id(current_user.id)

    shared_basket.shared_links.order('created_at DESC').each do |link|
      data = {}
      data["title"] = link.title
      data["message"] = link.message
      data["url"] = link.url
      data["sender"] = User.find(link.sender_id).name
      data["date"] = link.created_at.strftime("%a, %b %d")
      data["time"] = link.created_at.strftime("%l:%M%P")
      @return_links << data
    end

    render partial: "inbox_links"
    #For Angular
    # shared_basket.shared_links.each do |link|
    #   data = {}
    #   data["title"] = link.title
    #   data["message"] = link.message
    #   data["sender"] = User.find(link.sender_id).name
    #   data["date"] = link.created_at
    #   return_links << data
    # end

    # return return_links.to_json


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

    # post_notification(friend_id, shared_basket)

    redirect_to root_url
  end


  private

  # def post_notification(friends_info, shared_basket)
  #   RestClient.post(/{recipient_userid}/notifications?access_token= current_user.oauth_token)


  #   POST /{recipient_userid}/notifications?
  #        access_token= current_user.oauth_token
  #        href= "http://www.mybasketsapp.com/shared_baskets/#{shared_basket}"
  #        template=Test user has sent you a link on Basket!
  # end
end