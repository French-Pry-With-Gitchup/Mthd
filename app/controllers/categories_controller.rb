class CategoriesController < ApplicationController
    before_action :check_to_see_if_someones_logged_in

    def index
        @categories = @logged_in_user.categories
    end

    def show
        @category = Category.find(params[:id])
    end

    def new
        @category = Category.new
    end

    def create
        @category = @logged_in_user.categories.create(category_params)
        if @category.valid?                                
            redirect_to category_path(@category.id)              
        else
            flash[:errors] = @category.errors.full_messages    
            redirect_to new_category_path(@category)               
        end
    end

      private

      def user_find
          @user = User.find(params[:id])                      #   Searches for the User by their ID on the table
      end
  
      def category_params
          params.require(:category).permit(:name, :language, :description)      #   Does Proper Validation Check for User Parameters
      end
end
