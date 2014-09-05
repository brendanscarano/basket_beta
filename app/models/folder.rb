class Folder < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user

  has_many :folder_links
  has_many :links, through: :folder_links
end