class PagesController < ApplicationController
  def new
    @notebook = Notebook.find_by(id: params[:notebook_id])
    @page = @notebook.pages.build
  end

  def create
    @notebook = Notebook.find_by(id: params[:notebook_id])
    @page = @notebook.pages.build(page_params)

    if @page.save
      redirect_to notebook_page_path(params[:notebook_id], @page.id)
    end
  end

  private

  def page_params
    params.require(:page).permit(:title, :body)
  end
end
