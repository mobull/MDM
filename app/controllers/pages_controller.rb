class PagesController < ApplicationController

  before_filter :authenticate_user!

  def panel
    @devices = Device.all
  end
end
