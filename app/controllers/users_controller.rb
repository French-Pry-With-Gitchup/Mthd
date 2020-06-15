class UsersController < ApplicationController

    def login_form
    end

    def handle_login
        # byebug
        @user = User.find_by(name: params[:username])
        if @user && @user.authenticate(params[:password])
            redirect_to @user
        else
            redirect_to users_login_path
        end
    end

    # Controls Views for new
    def new
        @user = User.new
    end

    # Controls the table creation logic
    def create
        @user = User.new(user_params)                       #   Creates a new user by grabbing the user parameters
        @user.save                                          #   Saves the User to the Database

        if @user.valid?                                     #   Checks if the User passes the Validation Checks
            redirect_to user_path(@user.id)                 #   Redirects the user to the User Page after the creation is done
        else
            flash[:errors] = @user.errors.full_messages     #   If the user does not type in the right password then an Error pops up
            redirect_to sign_up_path                        #   The user is also resent to the current page after the check
        end
    end

    # Shows the given user found by the table ID
    def show
        @user = User.find(user_params)
    end

    # Controls Views for edit
    def edit
    end
    
    # Controls the table update logic
    def update
        user_find
        user_find.update(user_params)

        redirect_to user_path(@user)
    end

    private

    def user_find
        @user = User.find(params[:id])                      # Searches for the User by their ID on the table
    end

    def user_params
        params.require(:user).permit(:name, :password)      # Does Proper Validation Check for User Parameters
    end

end




########## UPDATE / EDIT CRUD FUNCTIONALITY ##########
    # Controls Views for edit
    # def edit
    #     @user = User.find(params[:id])
    # end
    
    # Controls the table update logic
    # def update
    #     @user = User.find(params[:id])
    #     @user.update(user_params)

    #     redirect_to user_path(@user)
    # end
########## UPDATE / EDIT CRUD FUNCTIONALITY ##########