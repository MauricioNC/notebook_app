class AddCategoryFieldToPages < ActiveRecord::Migration[7.2]
  def change
    add_column :pages, :category, :string
  end
end
