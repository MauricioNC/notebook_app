class HomeController < ApplicationController
  def index
    @notebooks = Notebook.all
  end
end
