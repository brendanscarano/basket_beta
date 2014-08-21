class User < ActiveRecord::Base
  has_many :user_folders
  has_many :folders, through: :user_folders

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
    graph = Koala::Facebook::GraphAPI.new(self.oauth_token)
    # return graph.get_connections("me", "friends", api_version: 'v2.0')

=begin
  Possible code to get friends
  
=end
    friends_list = []
    friends = graph.get_connections("me", "friends", api_version: 'v2.0')
    p "=" * 30
    p friends
    p "=" * 30
    friends.each do |friend|
      friends_list << User.find_by_uid(friend["id"])
    end

    return friends_list
  end
end