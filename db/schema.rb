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

ActiveRecord::Schema.define(version: 2019_11_29_123051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.string "state_code", null: false
    t.string "country_code", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.bigint "state_id"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "continents", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.string "iso2", null: false
    t.string "iso3"
    t.string "capital"
    t.string "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "continent_id"
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.index ["continent_id"], name: "index_countries_on_continent_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "name"
    t.datetime "start", null: false
    t.datetime "end", null: false
    t.integer "admission_fee"
    t.integer "other_cost", default: 0
    t.integer "duration", default: 0
    t.string "note"
    t.bigint "trip_id"
    t.bigint "spot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_schedules_on_spot_id"
    t.index ["trip_id"], name: "index_schedules_on_trip_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "name", null: false
    t.integer "admission_fee", default: 0
    t.integer "duration", default: 0
    t.string "main_image"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name", null: false
    t.string "country_code", null: false
    t.string "state_code", null: false
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "to_cities", force: :cascade do |t|
    t.bigint "city_id"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_to_cities_on_city_id"
    t.index ["trip_id"], name: "index_to_cities_on_trip_id"
  end

  create_table "to_countries", force: :cascade do |t|
    t.bigint "country_id"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_to_countries_on_country_id"
    t.index ["trip_id"], name: "index_to_countries_on_trip_id"
  end

  create_table "to_states", force: :cascade do |t|
    t.bigint "state_id"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_to_states_on_state_id"
    t.index ["trip_id"], name: "index_to_states_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "trip_image"
    t.date "start_day", null: false
    t.date "end_day", null: false
    t.integer "status", default: 0
    t.boolean "privacy", default: false
    t.integer "est_amount", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "user_spots", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "spot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_user_spots_on_spot_id"
    t.index ["user_id", "spot_id"], name: "index_user_spots_on_user_id_and_spot_id", unique: true
    t.index ["user_id"], name: "index_user_spots_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "avatar"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "country_id"
    t.bigint "state_id"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["state_id"], name: "index_users_on_state_id"
  end

  create_table "visited_countries", force: :cascade do |t|
    t.bigint "country_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_visited_countries_on_country_id"
    t.index ["user_id", "country_id"], name: "index_visited_countries_on_user_id_and_country_id", unique: true
    t.index ["user_id"], name: "index_visited_countries_on_user_id"
  end

  add_foreign_key "cities", "countries"
  add_foreign_key "cities", "states"
  add_foreign_key "countries", "continents"
  add_foreign_key "schedules", "spots"
  add_foreign_key "schedules", "trips"
  add_foreign_key "states", "countries"
  add_foreign_key "to_cities", "cities"
  add_foreign_key "to_cities", "trips"
  add_foreign_key "to_countries", "countries"
  add_foreign_key "to_countries", "trips"
  add_foreign_key "to_states", "states"
  add_foreign_key "to_states", "trips"
  add_foreign_key "trips", "users"
  add_foreign_key "user_spots", "spots"
  add_foreign_key "user_spots", "users"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "countries"
  add_foreign_key "users", "states"
  add_foreign_key "visited_countries", "countries"
  add_foreign_key "visited_countries", "users"
end
