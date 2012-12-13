class PagesController < ApplicationController

  before_filter :authenticate_user!

  def dashboard
    @show_background = true
  end
end
