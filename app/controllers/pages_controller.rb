class PagesController < ApplicationController

  before_filter :authenticate_user!

  def dashboard
    @show_background = true
    @devices = Device.all
  end
end
