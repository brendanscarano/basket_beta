class SharedBasket < ActiveRecord::Base
  belongs_to :user
  has_many :shared_links

  def shared_link_array
    links = []
    
    self.shared_links.order('created_at DESC').each do |link|
      user = User.find(link.sender_id)
      links << [link,
                user.name, 
                user.image] 
    end

    return links
  end
end