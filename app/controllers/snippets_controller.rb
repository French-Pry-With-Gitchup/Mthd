class SnippetsController < ApplicationController
  before_action :check_to_see_if_someones_logged_in

  def index
    @snippets = @logged_in_user.snippets
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  def new
    @snippet = Snippet.new
  end

  def edit
    @snippet = Snippet.find(params[:id])
  end

  def update
    @snippet = Snippet.find(params[:id])
    @snippet.update(snippet_params)
    redirect_to snippet_path(@snippet.id)
  end

  def create
    @snippet = @logged_in_user.snippets.create(snippet_params)
    if @logged_in_user != nil
        if @snippet.valid?
          redirect_to snippet_path(@snippet.id)
        else
          flash[:errors] = @snippet.errors.full_messages
          redirect_to new_snippet_path(@snippet)
        end
      else
        respond_to do |format|
            format.html { redirect_to user_login_path notice: 'Please Log In' }
        end
    end
  end

  private

  def snippet_params
    params.require(:snippet).permit(:title, :code, :is_private)
  end
end
