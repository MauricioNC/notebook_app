class CreatePages < ActiveRecord::Migration[7.2]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.text :body

      t.timestamps
    end
  end
end
