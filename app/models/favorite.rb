class Favorite < ActiveRecord::Base
  belongs_to :favor, class_name: "User"
  belongs_to :favored, class_name: "Micropost"
end
