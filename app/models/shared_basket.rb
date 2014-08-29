class SharedBasket < ActiveRecord::Base
  belongs_to :user
  has_many :shared_links

  def shared_link_array
    links = []
    
    self.shared_links.order('created_at DESC').each do |link|
      user = User.find(link.sender_id)
      links << [user.name, 
                user.image,
                link.url, 
                link.created_at.strftime("%A, %b %d %Y"),
                link.created_at.strftime("%l:%M%P")] 
    end

    return links
  end
end