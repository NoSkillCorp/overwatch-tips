class HomeController < ApplicationController
  def index
      greatest_tips = Tip.greatest_tips(5)
      latest_tips = Tip.latest_tips(5)
      trending_tips = Tip.trending_tips(5)
      
      @tips_hash = { greatest: greatest_tips, trending: trending_tips, latest: latest_tips }
      
      @is_mobile = (request.user_agent =~ /Mobile|webOS/)
  end
  
  def news
    @order = params[:order] || "trending"
    @tips = Tip.send("#{@order}_tips", 10, params[:page])
  end
  
  def about
  end
end
