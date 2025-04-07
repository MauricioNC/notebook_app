class NotebooksController < ApplicationController
  def new
    @notebook = Notebook.new
  end

  def create
    @notebook = Notebook.new(notebook_params)

    if @notebook.save
      redirect_to root_path
    end
  end

  private

  def notebook_params
    params.require(:notebook).permit(:name)
  end
end
