class AddDateToTransactions < ActiveRecord::Migration[8.0]
  def change
    add_column :transactions, :date, :date, null: false
    add_index :transactions, :date
  end
end
