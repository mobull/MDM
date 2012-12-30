module Api
  module V1
    class DevicesController < ApplicationController

      before_filter :authenticate_user!

      respond_to :json

      def index
        @devices = Device.all

        respond_with @devices
      end

      def show
        @device = Device.find(params[:id])

        respond_with @device
      end

      def create
        @device = Device.new(device_params)

        flash[:nofice] = 'Device was successfully created.' if @device.save
        respond_with @device, location: devices_path
      end

      def update
        @device = Device.find(params[:id])

        flash[:nofice] = 'Device was successfully updated.' if @device.update_attributes(device_params)
        respond_with @device
      end

      def destroy
        @device = Device.find(params[:id])
        @device.destroy

        respond_with @device
      end

      private

        def device_params
          params.require(:device).permit(:name, :user_id, :device_ownership_id, :platform_identifier)
        end
    end
  end
end
