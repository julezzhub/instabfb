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

ActiveRecord::Schema.define(version: 2019_11_27_093037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "boyfriend_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boyfriend_id"], name: "index_bookings_on_boyfriend_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "boyfriends", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "likes"
    t.string "location"
    t.integer "height"
    t.string "smartphone_model"
    t.string "pet"
    t.string "category"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_boyfriends_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "boyfriend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link"
    t.index ["boyfriend_id"], name: "index_images_on_boyfriend_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "boyfriend_id"
    t.integer "rating"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boyfriend_id"], name: "index_reviews_on_boyfriend_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
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
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "boyfriends"
  add_foreign_key "bookings", "users"
  add_foreign_key "boyfriends", "users"
  add_foreign_key "images", "boyfriends"
  add_foreign_key "reviews", "boyfriends"
  add_foreign_key "reviews", "users"
end
