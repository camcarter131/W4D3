class ApplicationController < ActionController::Base
    helper_method :current_user, :login_user!

    def current_user
        user = User.find_by(session_token: session[:session_token])
    end

    def login_user!(user)
        session[:session_token] = user.reset_session_token! 
    end

end
