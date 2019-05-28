class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :cpf
      t.string :telefone
      t.string :email
      t.integer :tipo, default: 0

      t.timestamps
    end
  end
end
