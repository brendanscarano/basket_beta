class PublicController < ApplicationController
  before_action :set_new_folder

  def about
  end

  def extension
  end

  private

  def set_new_folder
    @new_folder = Folder.new
  end
end