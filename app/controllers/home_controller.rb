class HomeController < ApplicationController
  def index
      @characters = Character.all
  end
end
