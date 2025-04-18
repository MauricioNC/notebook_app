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
          render json: { title: page.title, category: page.category }.to_json
        end
      end
    end
  end

  def destroy
    @page = Page.find_by(id: params[:id])
    @page.destroy

    respond_to do |f|
      f.html { redirect_to notebook_path(params[:notebook_id]) }
      f.turbo_stream
    end
  end

  private

  def page_params
    params.require(:page).permit(:title, :body, :category)
  end
end
