class UsersController < ApplicationController
    before_action :user_find, only: [:show, :edit, :update, :destroy]
    before_action :check_to_see_if_someones_logged_in, only: [:edit, :update, :destroy]

    # Shows the given user found by the table ID
    def show
    end

    # Controls Views for new
    def new
        @user = User.new
        @errors = flash[:errors]
    end

    # Controls the table creation logic
    def create
        @user = User.new(user_params)                       #   Creates a new user by grabbing the user parameters
        @user.save                                          #   Saves the User to the Database

        if @user.valid?                                     #   Checks if the User passes the Validation Checks
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)                 #   Redirects the user to the User Page after the creation is done
        else
            flash[:errors] = @user.errors.full_messages     #   If the user does not type in the right password then an Error pops up
            redirect_to sign_up_path                        #   The user is also resent to the current page after the check
        end
    end

    # Controls Views for edit
    def edit
        unless @logged_in_user.id == @user.id
            redirect_to @logged_in_user
          end
    end

    # Controls the table update logic
    def update
        @user = User.find(params[:id])
        @user.update(user_params)                           #   Updates the users settings with Validated incoming Parameters
        redirect_to user_path(@user)                        #   Redirects to the User page
    end

    # Handles deletion of USER Account
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        # redirect_to user_login_path
        respond_to do |format|
            format.html { redirect_to user_login_path notice: 'User was successfully deleted.' }
        end
    end

    # Entry point for login View page
    def login_form
        @errors = flash[:errors]
    end
    

    # Handles incoming data from Login form
    def handle_login
        @user = User.find_by(name: params[:name])           #
        if @user && @user.authenticate(params[:password])   #   IF the user exists and if the User password Authenticates properly, then user "signs in"
            session[:user_id] = @user.id
            redirect_to @user                               #   Redirects to user page
        else
            flash[:errors] = "Wrong Username/Password"      #   Throws error on incorrect username/password validation
            redirect_to user_login_path                     #   Redirects to login page
        end
    end

    def logout
        session[:user_id] = nil
        redirect_to user_login_path
    end
    private

    def user_find
        @user = User.find(params[:id])                      #   Searches for the User by their ID on the table
    end

    def user_params
        params.require(:user).permit(:name, :password)      #   Does Proper Validation Check for User Parameters
    end

end
