class UserFolder < ActiveRecord::Base
  validates :user, :folder, presence: true

  belongs_to :user, dependent: :destroy
  belongs_to :folder, dependent: :destroy
end