class Api::GamingObjectsController < ApplicationController
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
      @gaming_object = GamingObject.friendly.where(type: params[:type]).find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def gaming_objects_params
      params.permit(:id, :type)
    end
end
