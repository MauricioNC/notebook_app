class PagesController < ApplicationController
  def show
    @page = Page.find_by(id: params[:id])
  end

  def new
    @notebook = Notebook.find_by(id: params[:notebook_id])
    @page = @notebook.pages.build
  end

  def create
    @notebook = Notebook.find_by(id: params[:notebook_id])
    @page = @notebook.pages.build({title: 'Untitled'})

    if @page.save
      redirect_to notebook_page_path(params[:notebook_id], @page.id)
    end
  end

  def update
    page = Page.find_by(id: params[:id])

    if page.update(page_params)
      respond_to do |f|
        f.json do
          render json: { title: page.title }.to_json
        end
      end
    end
  end

  private

  def page_params
    params.require(:page).permit(:title, :emoji)
  end
end
