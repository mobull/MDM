class PagesController < ApplicationController
  layout 'admin', only: [:dashboard]

  before_filter :authenticate_user!

  def dashboard
    
  end
end
