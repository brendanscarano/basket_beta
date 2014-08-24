class SharedBasket < ActiveRecord::Base
  belongs_to :user
  has_many :shared_links

  def shared_link_array
    links = []
    
    self.shared_links.each do |link|
      user = User.find(link.sender_id)
      links << [user.name, link.url] 
    end

    return links
  end
end