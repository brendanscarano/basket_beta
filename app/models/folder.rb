class Folder < ActiveRecord::Base
  validates :name, presence: true

  has_many :folder_links
  has_many :links, through: :folder_links
end