class ChangeStatusFromDemandas < ActiveRecord::Migration[5.2]
  def change
    remove_column :demandas, :status
    add_column :demandas, :situacao, :integer
  end
end
