class Post < ActiveRecord::Base
  attr_accessible :user, :title, :content, :liked, :disliked
  belongs_to :user
end
