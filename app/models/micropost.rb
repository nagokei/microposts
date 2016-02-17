class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  
  # favorite
  has_many :favorites,     dependent: :destroy
  has_many :favored_users, through: :favorites,
                           class_name: 'User'
end
