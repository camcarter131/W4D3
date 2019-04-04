class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(user_params[:user_name],user_params[:password])
        if user
            login_user!(user)
            redirect_to cats_url
        else
            render :new
        end
    end

    def destroy
        current_user.reset_session_token! if current_user
        session[:session_token] = nil
        render :new
    end

    private

    def user_params
        params.require(:user).permit(:user_name, :password)
    end
end
