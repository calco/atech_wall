class RenameUserUserIdInPosts < ActiveRecord::Migration
  def self.up
  	rename_column :posts, :user, :user_id
  end

  def self.down
  	rename_column :posts, :user_id, :user
  end
end
