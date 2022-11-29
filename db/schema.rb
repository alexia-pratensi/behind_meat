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

ActiveRecord::Schema[7.0].define(version: 2022_11_29_103333) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consos", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "day_id", null: false
    t.bigint "meat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_consos_on_day_id"
    t.index ["meat_id"], name: "index_consos_on_meat_id"
  end

  create_table "days", force: :cascade do |t|
    t.date "date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_days_on_user_id"
  end

  create_table "meats", force: :cascade do |t|
    t.string "meat_type"
    t.float "water_impact"
    t.float "carbon_impact"
    t.integer "tree_impact"
    t.integer "animal_impact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.float "water"
    t.float "carbon"
    t.integer "tree"
    t.integer "animal"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "consos", "days"
  add_foreign_key "consos", "meats"
  add_foreign_key "days", "users"
end
