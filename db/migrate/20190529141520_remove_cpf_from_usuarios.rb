class RemoveCpfFromUsuarios < ActiveRecord::Migration[5.2]
  def change
    remove_column :usuarios, :cpf
  end
end
