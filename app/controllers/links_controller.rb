class LinksController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def new_link
    p "The params are:"
    p params

    redirect_to root_url
  end

end