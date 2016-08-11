class Api::GamingObjectsController < ApplicationController

    def characters
        gaming_objects = Character.all
        render json: gaming_objects
    end
    
    def maps
        gaming_objects = Map.all
        render json: gaming_objects
    end
    
    def gaming_objects
        gaming_objects = GamingObject.all
        render json: gaming_objects
    end
end
