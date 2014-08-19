class Folder_Link < ActiveRecord::Base
  validates :folder, :link, presence: true

  belongs_to :folder, dependent: :destroy
  belongs_to :link, dependent: :destroy
  # belongs_to :user, dependent: :destroy
end