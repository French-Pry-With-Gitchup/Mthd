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
    @snippet = 
  end
end
