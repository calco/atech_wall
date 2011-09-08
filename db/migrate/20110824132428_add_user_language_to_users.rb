class AddUserLanguageToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :user_language, :string
  end

  def self.down
    remove_column :users, :user_language
  end
end
