class GroupsController < ApplicationController
  layout 'admin'

  before_filter :authenticate_user!

  respond_to :html, :json

  def index 
    @groups = Group.all
  end
end
