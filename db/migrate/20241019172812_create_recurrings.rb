class CreateRecurrings < ActiveRecord::Migration[8.0]
  def change
    create_table :recurrings do |t|
      t.string :name, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.integer :day_of_month, null: false, default: 1
      t.string :link

      t.timestamps
    end
  end
end
