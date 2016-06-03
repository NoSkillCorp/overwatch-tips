class HomeController < ApplicationController
  def index
      greatest_tips = Tip.ordered_by_score.limit(5)
      latest_tips = Tip.order(created_at: :desc).limit(5)
      trending_tips = Tip.joins_last_vote.order("votes.created_at DESC").limit(5)
      
      @tips_hash = { greatest: greatest_tips, latest: latest_tips, trending: trending_tips }
      
      @is_mobile = (request.user_agent =~ /Mobile|webOS/)
  end
  
  def news
    @tips = Tip.order(created_at: :desc).page(params[:page]).per(10)
  end
  
  def about
  end
end
