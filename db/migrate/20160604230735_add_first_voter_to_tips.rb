class AddFirstVoterToTips < ActiveRecord::Migration
  def change
    tips = Tip.where(user_cookie: nil)
    tips.each do |tip|
      first_voter = tip.votes.order(:created_at).first.try(:user)
      tip.user = first_voter
      tip.save
    end
  end
end
