class Api::V1::AuthenticateController < ApplicationController
  skip_before_action :authenticate_user
  
  def create
    @user = User.find_by(email: user_params[:email])
    @token = AuthenticateTokenService.encode(@user.id.to_s)
          
    render json: {token: @token}
  end
  
  private
  
  def user_params
    params.permit(:email, :password)
  end
end