class ApplicationController < ActionController::Base
    helper_method :logged_in_user, :logged_in?

    def logged_in_user
        # Returns nil if nobody is logged in
        # Returns the instance of whoever does log in
        # if session[:user_id]
            @logged_in_user = User.find_by(id: session[:user_id])
        # end
    end

    # Checks if User
    def logged_in?
        !!logged_in_user()
    end

    # Stop the view/action from completely being rendered onto the page
  def check_to_see_if_someones_logged_in
    # if they are not logged in, they will be sent to the login page
    redirect_to user_login_path unless logged_in?
  end
end
