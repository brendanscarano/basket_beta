class SharedBasket < ActiveRecord::Base
  belongs_to :user
  has_many :shared_links

  def shared_link_array
    links = []
    
    self.shared_links.each do |link|
      user = User.find(link.sender_id)
      links << [user.name, 
                user.image,
                link.url, 
                link.created_at.strftime("%b %d %Y"),
                link.created_at.strftime("%l:%M%P")] 
    end

    return links
  end
end