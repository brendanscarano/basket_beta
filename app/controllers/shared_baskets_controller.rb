class SharedBasketsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def show
    shared_basket = SharedBasket.find(params[:id])
    @links = shared_basket.shared_links
  end

end