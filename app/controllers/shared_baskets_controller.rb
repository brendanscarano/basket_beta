class SharedBasketsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def show
    @new_folder = Folder.new
    
    shared_basket = SharedBasket.find(params[:id])
    @links = shared_basket.shared_link_array
  end

end