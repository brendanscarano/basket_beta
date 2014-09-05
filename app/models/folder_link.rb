class FolderLink < ActiveRecord::Base
  validates :folder, :link, presence: true

  belongs_to :folder
  belongs_to :link
end