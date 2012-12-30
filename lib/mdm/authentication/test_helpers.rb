module Authentication
  module TestHelpers
    def sign_in(user)
      session[:user_id] = user.id
    end

    def sign_out
      session.delete(:user_id)
    end
  end
end
