class CreatePecas < ActiveRecord::Migration[5.2]
  def change
    create_table :pecas do |t|
      t.integer :tipo
      t.text :descricao
      t.float :valor

      t.timestamps
    end
  end
end
