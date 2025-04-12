class AddNotebookToPages < ActiveRecord::Migration[7.2]
  def change
    add_reference :pages, :notebook, null: false, index: true, foreign_key: true
  end
end
