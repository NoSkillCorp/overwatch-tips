class AddUserCookieToVote < ActiveRecord::Migration
  def change
    add_column :votes, :user_cookie, :string
    add_index :votes, [:tip_id, :user_cookie]
  end
end
