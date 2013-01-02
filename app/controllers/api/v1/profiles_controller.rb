module Api
  module V1
    class ProfilesController < ApplicationController

      before_filter :authenticate_user!

      respond_to :json
    end
  end
end
