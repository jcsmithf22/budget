class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.string :name, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.text :notes
      t.references :bucket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
