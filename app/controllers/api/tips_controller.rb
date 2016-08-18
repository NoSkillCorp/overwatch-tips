class Api::TipsController < ApplicationController

    def random
        random_tip = Tip.random
        render json: random_tip
    end
    
    def index
        #type = tips_params[:type]
        category = tips_params[:category]
        gaming_object_id = tips_params[:character_id] || tips_params[:map_id]
        gaming_object = GamingObject.friendly.find(gaming_object_id)
        
        #gets the tips of the gaming object, ordered by score and with positive score
        categotips = category.present? ? gaming_object.tips.where(category: category) : gaming_object.tips
        tips = categotips.ordered_by_score.select{|tip| tip.score > 0 } #All these calls to the tip.score are redundant with ordered_by_score, could optimize this
            
        render json: tips
    end
    
    def tips_params
        params.permit(:type, :character_id, :map_id, :category)
    end
end
