class SessionsController < ApplicationController
  def new
  end
  
  def create
    if user = User.authenticate(credential_params)
      sign_in(user)
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to root_url, notice: "Logged out!"
  end

  private

    def credential_params
      params.require(:credential).permit(:login, :password)
    end
end
