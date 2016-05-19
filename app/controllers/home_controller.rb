class HomeController < ApplicationController
  def index
      #@tips = Tip.order(created_at: :desc).limit(10)
      @tips = Tip.joins(:votes).select("SUM(votes.weight) as score, tips.*").group('tips.id').order("score DESC").limit(4)
      @is_mobile = (request.user_agent =~ /Mobile|webOS/)
  end
  
  def news
    @tips = Tip.order(created_at: :desc).limit(10)
  end
  
  def about
  end
end
