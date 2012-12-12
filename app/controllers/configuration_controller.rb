class ConfigurationController < ApplicationController

  before_filter :authenticate_user!

  respond_to :json

  def edit
    @configuration = ::Configuration.new
    respond_with @configuration
  end

  def update
    configuration = ::Configuration.new
    flash[notice] = 'Configuration was successfully updated.' if configuration.update_attributes(configuration_params)
    respond_with configuration, location: configuration_path
  end

  private

    def configuration_params
      params.require(:configuration).permit(:company_legal_name, :company_display_name, :help_desk_guide)
    end
end
