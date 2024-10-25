class AddUserToModels < ActiveRecord::Migration[8.0]
  def change
    add_reference :buckets, :user, null: false, foreign_key: true
    add_reference :recurrings, :user, null: false, foreign_key: true
    add_reference :transactions, :user, null: false, foreign_key: true
  end
end
