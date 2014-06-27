class Folder_Link < ActiveRecord::Base
  validates :folder, :link, :user, presence: true

  belongs_to :folder
  belongs_to :link
  belongs_to :user
end