class ProfilesController < ApplicationController
	layout 'admin'

  before_filter :authenticate_user!

  respond_to :html, :json
end
