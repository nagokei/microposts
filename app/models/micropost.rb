class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  # retweet
  has_many :retweeting_retweets, class_name: "Retweet",
                                 foreign_key: "retweeter_id",
                                 dependent: :destroy
  has_many :retweeting_microposts, through: :retweeting_retweets, source: :retweeted
  
  def retweet(other_microposts)
    retweeting_retweets.find_or_create_by(retweeted_id: other_microposts.id)
  end
  
  def unretweet(other_microposts)
    retweeting_retweet = retweeting_retweets.find_by(retweeted_id: other_microposts.id)
    retweeting_retweet.destroy if retweeting_retweet
  end
  
  def retweeting?(other_microposts)
    retweeting_microposts.include?(other_microposts)
  end
  
end
