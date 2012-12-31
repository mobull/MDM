module Api
  module V1
    class UsersController < ApplicationController

      before_filter :authenticate_user!

      respond_to :json

      def index
        @users = User.all(include: :groups)
      end

      def show
        @user = User.find(params[:id])
      end

      def create
        @user = User.new(user_params)
        @user.save

        render 'show'
      end

      def update
        user = User.find(params[:id])
        user.update_attributes(user_params)

        respond_with user
      end

      private

        def user_params
          params.require(:user).permit(:name, :email, :bio, :password, :password_confirmation)
        end
    end
  end
end
