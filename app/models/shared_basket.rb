class SharedBasket < ActiveRecord::Base
  belongs_to :user
  has_many :shared_links
end