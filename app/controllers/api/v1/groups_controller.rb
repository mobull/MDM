module Api
  module V1
    class GroupsController < ApplicationController

      before_filter :authenticate_user!

      respond_to :json

      def index
        @groups = Group.higher_priority_first
        respond_with @groups
      end

      def show
        @group = Group.find(params[:id])
        respond_with @group
      end

      def create
        @group = Group.new
        @group.update_attributes(group_param)
        respond_with @group, location: api_v1_group_url(@group)
      end

      private

        def group_param
          params.require(:group).permit(:name)
        end
    end
  end
end
