class CreateLimits < ActiveRecord::Migration[8.0]
  def change
    create_table :limits do |t|
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.string :month, null: false

      t.timestamps
    end
  end
end
