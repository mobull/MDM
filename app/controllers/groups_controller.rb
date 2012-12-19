class GroupsController < ApplicationController
  layout 'admin'

  before_filter :authenticate_user!

  respond_to :html, :json

  def index 
    @groups = Group.higher_priority_first
  end

  def show
    if params[:id] == 'all_members'
      @users = User.all
    else
      @group = Group.find(params[:id])
      @users = @group.users
    end
  end

  # def new 
  #   @group = Group.new
  # end

  # def edit 
  #   @group = Group.find(params[:id])
  # end
end
