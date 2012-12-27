class ApplicationController < ActionController::Base
  include Authentication::DatabaseAuthenticatable

  protect_from_forgery
end
