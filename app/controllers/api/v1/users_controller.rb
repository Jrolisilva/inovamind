class Api::V1::UsersController < ApplicationController
      skip_before_action :authenticate_user, only: [:create]
      def create
        @user = User.create!(user_params)
        render json: {message: 'Usuario criado com sucesso'}, status: :created
      end

      private

      def user_params
        params.permit(:email, :password)
      end
end