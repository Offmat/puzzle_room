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

ActiveRecord::Schema.define(version: 20180116202143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "puzzles", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "level", limit: 2
    t.integer "design_year", limit: 2
    t.bigint "company_id"
    t.bigint "inventor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_puzzles_on_company_id"
    t.index ["inventor_id"], name: "index_puzzles_on_inventor_id"
    t.index ["name"], name: "index_puzzles_on_name", unique: true
  end

  add_foreign_key "companies", "countries"
  add_foreign_key "inventors", "countries"
  add_foreign_key "makes", "materials"
  add_foreign_key "makes", "puzzles"
  add_foreign_key "puzzles", "companies"
  add_foreign_key "puzzles", "inventors"
end
