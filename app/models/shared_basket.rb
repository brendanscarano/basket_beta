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

  def notifications
    notifications = 0
    time = Time.now.getutc

    shared_basket = SharedBasket.find_by_user_id(current_user.id)
    links = shared_basket.shared_links

    links.each do |link|
      if link.created_at > shared_basket.clicked
        notifications += 1
      end
    end

    return notifications

  end
end