class ChangeDateDefaultInTransactions < ActiveRecord::Migration[8.0]
  def change
    change_column_default :transactions, :date, -> { 'CURRENT_DATE' }
  end
end
