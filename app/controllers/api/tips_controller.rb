class Api::TipsController < Api::BaseApiController
    
    before_action :check_type_and_category, :set_gaming_object, only: [:index]

    def random
        random_tip = Tip.random
        render json: random_tip
    end
    
    def index
        #gets the tips of the gaming object, ordered by score and with positive score
        categotips = @category.present? ? @gaming_object.tips.where(category: @category) : @gaming_object.tips
        tips = categotips.ordered_by_score.select{ |tip| tip.score > 0 } #All these calls to the tip.score are redundant with ordered_by_score, could optimize this
            
        render json: tips
    end

    private
            
        def tips_params
            params.permit(:type, :character_id, :map_id, :category)
        end
        
        def set_gaming_object
            gaming_object_id = tips_params[:character_id] || tips_params[:map_id]
            begin
                @gaming_object = GamingObject.friendly.find(gaming_object_id)
            rescue ActiveRecord::RecordNotFound
               render_bad_argument("id/slug", gaming_object_id)
            end
        end
        
        def check_type_and_category
            @type = tips_params[:type]
            @category = tips_params[:category]
            
            if @type.present? && !@type.in?(["Character", "Map"])
                render_bad_argument("type", @type)
            else
                if @category.present? && !@category.in?(@type.constantize::CATEGORIES)
                    render_bad_argument("category", @category)
                end
            end
        end

end
