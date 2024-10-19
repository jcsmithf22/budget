class CreateBuckets < ActiveRecord::Migration[8.0]
  def change
    create_table :buckets do |t|
      t.string :name, null: false
      t.decimal :limit, precision: 10, scale: 2

      t.timestamps
    end
  end
end
