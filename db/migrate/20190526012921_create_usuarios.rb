class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.integer :cpf
      t.string :telefone
      t.string :email
      t.integer :tipo

      t.timestamps
    end
  end
end
