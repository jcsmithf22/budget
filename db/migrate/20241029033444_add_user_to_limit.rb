class AddUserToLimit < ActiveRecord::Migration[8.0]
  def change
    add_reference :limits, :user, null: false, foreign_key: true
  end
end
