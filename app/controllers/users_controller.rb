class UsersController < ApplicationController
  layout 'admin'

  before_filter :authenticate_user!

  respond_to :html, :json

  def index
    @users = User.all(include: :groups)
  end

end
