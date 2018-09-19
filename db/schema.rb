# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_19_012648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "currency", limit: 3, null: false
    t.string "account_type", null: false
    t.string "account_subtype", null: false
    t.string "nickname", limit: 70
    t.string "scheme_name", null: false
    t.string "identification", limit: 34, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_accounts_on_owner_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "account_id"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", null: false
    t.datetime "booked_at", null: false
    t.integer "credit_or_debit", null: false
    t.string "description"
    t.integer "balance_cents", default: 0, null: false
    t.string "balance_currency", null: false
    t.string "merchant_name"
    t.string "merchant_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_transactions_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid"], name: "index_users_on_uuid"
  end

  add_foreign_key "accounts", "users", column: "owner_id"
  add_foreign_key "transactions", "accounts"
end
