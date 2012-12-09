class ConfigurationController < ApplicationController

  before_filter :authenticate_user!

  respond_to :html, :json

  def edit
    @configuration = ::Configuration.new
    respond_with @configuration
  end

  def update
  end
end
