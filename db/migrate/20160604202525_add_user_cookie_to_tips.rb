class AddUserCookieToTips < ActiveRecord::Migration
  def change
    add_column :tips, :user_cookie, :string
    add_index :tips, :user_cookie
    add_index :users, :user_cookie
    add_index :votes, :user_cookie
  end
end
