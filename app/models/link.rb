class Link < ActiveRecord::Base
  validates :url, presence: true

  has_many :folder_links
  has_many :folders, through: :folder_links
end