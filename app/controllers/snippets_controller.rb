class SnippetsController < ApplicationController
  def index
    # flash error here
    @snippets = Snippet.all
  end
end
