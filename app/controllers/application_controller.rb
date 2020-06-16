class ApplicationController < ActionController::Base
    helper_method :logged_in_user, :logged_in?

    def logged_in_user
        # Returns nil if nobody is logged in
        # Returns the instance of whoever does log in
        if session[:user_id]
            @logged_in_user = User.find_by(id: session[:user_id])
        end
    end

    def logged_in?
        !!logged_in_user()
    end

end
