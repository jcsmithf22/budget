# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_10_20_224127) do
  create_table "buckets", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "limit", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recurrings", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.integer "day_of_month", default: 1, null: false
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.text "notes"
    t.integer "bucket_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date", default: -> { "CURRENT_DATE" }, null: false
    t.index ["bucket_id"], name: "index_transactions_on_bucket_id"
  end

  add_foreign_key "transactions", "buckets"
end
