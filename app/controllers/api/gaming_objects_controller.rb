class Api::GamingObjectsController < ApplicationController

    def index
        gaming_objects = Character.all
        render json: gaming_objects
    end
end
