class Api::GamingObjectsController < Api::BaseApiController
    before_action :set_gaming_object, only: [:show]
    
    def index
        gaming_objects = GamingObject.where(type: params[:type]).order(:name)
        render json: gaming_objects
    end

    def show
        render json: @gaming_object
    end
    
    private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_gaming_object
        type = gaming_objects_params[:type]
        id = gaming_objects_params[:id]
        begin
            @gaming_object = GamingObject.friendly.where(type: type).find(id)
        rescue ActiveRecord::RecordNotFound
            render_bad_argument("#{type} id/slug", id)
        end
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def gaming_objects_params
      params.permit(:id, :type)
    end
end
