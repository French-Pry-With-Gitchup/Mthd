class SnippetsController < ApplicationController
  before_action :check_to_see_if_someones_logged_in
  
  def index
    # flash error here
    @snippets = @logged_in_user.snippets
    # @snippets = Snippet.all
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = @logged_in_user.snippets.create(snippet_params)

    if @snippet.valid?                                
      redirect_to snippet_path(@snippet.id)              
    else
      flash[:errors] = @snippet.errors.full_messages    
      redirect_to new_snippet_path(@snippet)               
    end
  end

  private

  def snippet_params
    params.require(:snippet).permit(:title, :code, :is_private)
  end
end
