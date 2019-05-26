class CreateDemandas < ActiveRecord::Migration[5.2]
  def change
    create_table :demandas do |t|
      t.integer :status
      t.string :rua
      t.string :bairro
      t.string :cidade
      t.string :uf
      t.string :numero
      t.integer :cep
      t.text :complemento

      t.timestamps
    end
  end
end
