class ApplicationController < ActionController::Base
# json_response is a helper method in charnge of creating and rendering responses
    skip_before_action :verify_authenticity_token

    def json_response object, status = 200
        render json: object, status: status
    end

    def json_error error , status
        render json: error , status: status
    end
end
