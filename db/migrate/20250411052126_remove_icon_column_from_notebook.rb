class RemoveIconColumnFromNotebook < ActiveRecord::Migration[7.2]
  def change
    remove_column :notebooks, :icon
  end
end
