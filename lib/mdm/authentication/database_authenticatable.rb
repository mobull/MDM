module Authentication
  module DatabaseAuthenticatable

    def self.included(base)
      base.helper_method :current_user, :user_signed_in?
    end

    private

      def authenticate_user!
        unless user_signed_in?
          store_return_url
          redirect_to login_url, alert: "Not authorized!"
        end
      end

      def sign_in(user)
        session[:user_id] = user.id
        redirect_back
      end

      def current_user  
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end

      def user_signed_in?
        !!current_user
      end

      def redirect_back
        redirect_to(session[:return_url] || root_path)
        clear_return_url
      end

      def store_return_url
        session[:return_url] = request.fullpath
      end

      def clear_return_url
        session.delete(:return_url)
      end
  end
end
