class RolesController < ApplicationController

  before_filter :authenticate_user!

  respond_to :html, :json

  def index
    @roles = Role.all

    respond_with @roles
  end

  def show
    @role = Role.find(params[:id])

    respond_with @role
  end

  def new
    @role = Role.new

    respond_with(@role) do |format|
      format.json { head :no_content }
    end
  end

  def edit
    @role = Role.find(params[:id])

    respond_with(@role) do |format|
      format.json { head :no_content }
    end
  end

  def create
    @role = Role.new(params[:role])

    flash[:notice] = 'Role was successfully created.' if @role.save

    respond_with @role, location: roles_path
  end

  def update
    @role = Role.find(params[:id])

    flash[notice] = 'Role was successfully updated.' if @role.update_attributes(params[:role])

    respond_with @role
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_with @role
  end
end
