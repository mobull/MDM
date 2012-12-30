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
end
