class TipsController < ApplicationController
  include TipsHelper
  
  before_action :set_tip, only: [:upvote, :downvote, :show, :update]
  before_action :assign_user, only: [:create, :upvote, :downvote]

  # POST /tips
  def create
    @tip = Tip.new(tip_params.merge(user: @user))
    
    if @tip.save
      render partial: 'tips/show', locals: { tip: @tip }
    else
      render json: @tip.errors, status: :unprocessable_entity
    end
  end
  
  def show
    #Gets one of the trending tips as the random next one
    @random_next_tip = Tip.ordered_by_vote_count.where.not(id: @tip.id).sample
  end
  
  def update
    if @tip.user == @user
      if @tip.update(tip_params)
        render json: { description: description_with_links(@tip.description) }
      else
        render json: @tip.errors, status: :unprocessable_entity
      end
    else
      #doesn't update if wrong user
    end
  end
  
  def upvote
    @tip.upvote(@user)
    render json: @tip
  end
  
  def downvote
    @tip.downvote(@user)
    render json: @tip
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tip
      @tip = Tip.find(params[:id]) || Tip.find(params[:tip_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tip_params
      params.require(:tip).permit(:description, :gaming_object_id, :category)
    end
    
end
