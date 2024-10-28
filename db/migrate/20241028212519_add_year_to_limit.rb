class AddYearToLimit < ActiveRecord::Migration[8.0]
  def change
    add_column :limits, :year, :integer, null: false
  end
end
