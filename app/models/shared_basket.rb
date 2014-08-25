class SharedBasket < ActiveRecord::Base
  belongs_to :user
  has_many :shared_links

  def shared_link_array
    links = []
    
    self.shared_links.each do |link|
      user = User.find(link.sender_id)
      links << [user.name, 
                link.url, 
                link.created_at.strftime("%b %d %Y")] 
    end

    return links
  end
end