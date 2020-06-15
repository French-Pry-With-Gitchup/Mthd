class SnippetsController < ApplicationController
  def index
    # flash error here
    @snippets = Snippet.all
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.create(snippet_params)
    # @snippet.save
  end

  private

  def snippet_params
    params.require(:snippet).permit(:title, :code, :is_private)
  end
end
