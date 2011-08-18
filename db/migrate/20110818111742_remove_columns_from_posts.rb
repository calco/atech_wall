class RemoveColumnsFromPosts < ActiveRecord::Migration
  def self.up
  	remove_column :posts, :liked
  	remove_column :posts, :disliked
  end

  def self.down
  	add_column :posts, :liked, :integer
  	add_column :posts, :disliked, :integer
  end
end
