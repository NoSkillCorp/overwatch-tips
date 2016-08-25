class ReplaceUserCookieByUserIdInVotesAndTips < ActiveRecord::Migration[5.0]
  def change
    add_reference :tips, :user, foreign_key: :true
    add_reference :votes, :user, foreign_key: :true
    
    Tip.where.not(user_cookie: nil).each do |tip|
      tip.user_id = User.find_by(user_cookie: tip.user_cookie).try(:id)
      tip.save
    end
    
    Vote.where.not(user_cookie: nil).each do |vote|
      vote.user_id = User.find_by(user_cookie: vote.user_cookie).try(:id)
      vote.save
    end
    
    remove_index :tips, :user_cookie
    remove_index :votes, :user_cookie
    
    remove_column :tips, :user_cookie
    remove_column :votes, :user_cookie
  end
end
