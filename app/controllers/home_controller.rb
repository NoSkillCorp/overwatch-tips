class HomeController < ApplicationController
  def index
      @tips = Tip.order(created_at: :desc).limit(10)
  end
end
