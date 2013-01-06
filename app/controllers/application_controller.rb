class ApplicationController < ActionController::Base
  include Authentication::DatabaseAuthenticatable

  protect_from_forgery

  private

    def configuration
      @configuration ||= ::Configuration.new
    end
end
