class Api::BaseApiController < ActionController::API
    
    private
        
    def render_bad_argument(arg, value=nil)
      value_s = value ? " : #{value}" : ""
      render json: {"errors" => "Bad #{arg} argument#{value_s}" }, status: :bad_request and return
    end

    def render_standard_api_error(exception)
      render json: {"errors" => exception.message }, status: :internal_server_error and return
    end
    
end