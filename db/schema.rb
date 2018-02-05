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

ActiveRecord::Schema.define(version: 20180205182047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "body", null: false
    t.integer "commentable_id", null: false
    t.string "commentable_type", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "country_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_companies_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_countries_on_name", unique: true
  end

  create_table "inventors", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname"
    t.integer "century", limit: 2
    t.bigint "country_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_inventors_on_country_id"
  end

  create_table "makes", force: :cascade do |t|
    t.bigint "puzzle_id", null: false
    t.bigint "material_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_makes_on_material_id"
    t.index ["puzzle_id"], name: "index_makes_on_puzzle_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_materials_on_name", unique: true
  end

  create_table "possesions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "puzzle_id", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["puzzle_id"], name: "index_possesions_on_puzzle_id"
    t.index ["user_id", "puzzle_id"], name: "index_possesions_on_user_id_and_puzzle_id", unique: true
    t.index ["user_id"], name: "index_possesions_on_user_id"
  end

  create_table "puzzles", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "level", limit: 2, null: false
    t.integer "design_year", limit: 2
    t.bigint "company_id", null: false
    t.bigint "inventor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.index ["company_id"], name: "index_puzzles_on_company_id"
    t.index ["inventor_id"], name: "index_puzzles_on_inventor_id"
    t.index ["name"], name: "index_puzzles_on_name", unique: true
  end

  create_table "rates", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "puzzle_id", null: false
    t.integer "rating", limit: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["puzzle_id"], name: "index_rates_on_puzzle_id"
    t.index ["user_id", "puzzle_id"], name: "index_rates_on_user_id_and_puzzle_id", unique: true
    t.index ["user_id"], name: "index_rates_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name"
    t.string "surname"
    t.string "nickname", null: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "users"
  add_foreign_key "companies", "countries"
  add_foreign_key "inventors", "countries"
  add_foreign_key "makes", "materials"
  add_foreign_key "makes", "puzzles"
  add_foreign_key "possesions", "puzzles"
  add_foreign_key "possesions", "users"
  add_foreign_key "puzzles", "companies"
  add_foreign_key "puzzles", "inventors"
  add_foreign_key "rates", "puzzles"
  add_foreign_key "rates", "users"
end
