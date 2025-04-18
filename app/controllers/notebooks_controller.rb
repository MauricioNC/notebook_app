class NotebooksController < ApplicationController
  def show
    @notebook = Notebook.find_by(id: params[:id])
    @pages = @notebook.pages.order(updated_at: :desc)
  rescue => e
    redirect_to root_path, error: "#{e.message}", status: :unprocessable_entity
  end

  def new
    @notebook = Notebook.new
  end

  def create
    @notebook = Notebook.new(notebook_params)

    if @notebook.save
      respond_to do |f|
        f.html { redirect_to root_path, notice: "Notebook was successfully created." }
        f.turbo_stream { flash.now[:notice] = "Notebook was successfully created." }
      end
    end
  end

  def destroy
    @notebook = Notebook.find_by(id: params[:id])

    unless @notebook.pages.empty?
      @notebook.pages.destroy_all
    end

    @notebook.destroy

    respond_to do |f|
      f.html { redirect_to root_path, notice: "Notebook was deleted successfully" }
      f.turbo_stream
    end
  end

  private

  def notebook_params
    params.require(:notebook).permit(:name)
  end
end
