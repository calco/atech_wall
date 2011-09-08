class Like < ActiveRecord::Base
  attr_accessible :user_id, :post_id
  validates_uniqueness_of :post_id, :scope => :user_id
  
  belongs_to :user
  belongs_to :post
end
