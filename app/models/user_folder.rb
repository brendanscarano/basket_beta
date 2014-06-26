class UserFolder < ActiveRecord::Base
  validates :user, :folder, presence: true

  belongs_to :user
  belongs_to :folder
end