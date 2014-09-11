class PublicController < ApplicationController
  def about
    @new_folder = Folder.new
  end
end