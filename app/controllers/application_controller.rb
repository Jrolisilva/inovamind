class ApplicationController < ActionController::API
    before_action :authenticate_user
  
    private
  
    def token_request
        if request.headers["Authorization"].nil?
            return nil
        end
          request.headers["Authorization"].split(" ")[1]
    end
  
    def authenticate_user
        user_id = AuthenticateTokenService.decode(token_request)
        @current_user = User.find(user_id["user_id"])
        @current_user
    end
end
