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

        flash[:notice] = 'User was successfully created.' if @user.save

        respond_with @user, location: users_path
      end

      private

        def user_params
          params.require(:user).permit(:name, :email, :bio, :password, :password_confirmation)
        end
    end
  end
end
