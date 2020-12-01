# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_30_193316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allergies", force: :cascade do |t|
    t.string "reactions"
    t.string "medicine_name"
    t.bigint "user_id", null: false
    t.bigint "substance_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["substance_id"], name: "index_allergies_on_substance_id"
    t.index ["user_id"], name: "index_allergies_on_user_id"
  end

  create_table "compound_mixes", force: :cascade do |t|
    t.bigint "medicine_id", null: false
    t.bigint "substance_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["medicine_id"], name: "index_compound_mixes_on_medicine_id"
    t.index ["substance_id"], name: "index_compound_mixes_on_substance_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.string "principle"
    t.string "laboratory"
    t.string "medicine_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "substances", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cpf"
    t.date "birthdate"
    t.decimal "weight"
    t.string "phone"
    t.string "address"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "allergies", "substances"
  add_foreign_key "allergies", "users"
  add_foreign_key "compound_mixes", "medicines"
  add_foreign_key "compound_mixes", "substances"
end
