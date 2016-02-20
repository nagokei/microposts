class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  
  # favorite
  has_many :favorites,     dependent: :destroy
  has_many :favored_users, through: :favorites,
                           class_name: 'User'
                           
                           
  # retweet
  # has_many :retweets,      class_name: 'Micropost',
  #                          foreign_key: 'original_id'
  # belongs_to :original,    class_name: 'Micropost',
  #                          foreign_key: 'id'
                           
  # def retweet(micropost)
  #  retweets.find_or_create_by(original_id: micropost.id)
  #end
 
  #def retweet?(micropost)
  #end
   
end
