class User < ActiveRecord::Base
  has_many :folders
  has_one :shared_basket

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.image = auth.info.image
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end


  end

  def friends_using_app
    friends_list = []

    graph = Koala::Facebook::GraphAPI.new(self.oauth_token)
    binding.pry
    friends = graph.get_connections("me", "friends", api_version: 'v2.0')
    binding.pry
    friends.each do |friend|
      friends_list << User.find_by_uid(friend["id"])
    end

    friends_list.delete_if {|friend| friend == nil}
    return friends_list
  end
end