class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :user
      t.string :title
      t.text :content
      t.integer :liked
      t.integer :disliked
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
