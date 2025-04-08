class NotebooksController < ApplicationController
  def show
    @notebook = Notebook.find_by(id: params[:id])
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
        f.turbo_stream
      end
    end
  end

  private

  def notebook_params
    params.require(:notebook).permit(:name)
  end
end
