class GroupsController < ApplicationController
  layout 'admin'

  before_filter :authenticate_user!

  respond_to :html, :json

  def index 
    @groups = Group.higher_priority_first
  end

  # def show 
  #   @group = Group.find(params[:id])
  # end

  # def new 
  #   @group = Group.new
  # end

  # def edit 
  #   @group = Group.find(params[:id])
  # end
end
