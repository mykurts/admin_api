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

ActiveRecord::Schema.define(version: 2021_08_26_081413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "account_roles", force: :cascade do |t|
    t.string "name"
    t.string "access_inquiry", default: [], array: true
    t.string "access_verifier", default: [], array: true
    t.string "access_ireport", default: [], array: true
    t.string "access_news", default: [], array: true
    t.string "access_admin_users", default: [], array: true
    t.string "inquiry_barangay", default: [], array: true
    t.string "verifier_barangay", default: [], array: true
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "ability_type", limit: 2, default: 0
    t.json "abilities"
  end

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "mobile_number"
    t.integer "status", default: 0
    t.string "image"
    t.string "address"
    t.string "designation"
    t.string "department"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.bigint "account_role_id"
    t.string "uid", default: "", null: false
    t.string "provider", default: "uid", null: false
    t.json "tokens"
    t.index ["account_role_id"], name: "index_accounts_on_account_role_id"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["uid", "provider"], name: "index_accounts_on_uid_and_provider", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "trackable_type", null: false
    t.bigint "trackable_id", null: false
    t.string "action", default: ""
    t.string "trackable_to_json", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_activities_on_account_id"
    t.index ["trackable_type", "trackable_id"], name: "index_activities_on_trackable_type_and_trackable_id"
  end

  create_table "admin_notifications", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.boolean "is_read", default: false
    t.string "notifiable_type", null: false
    t.bigint "notifiable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["notifiable_type", "notifiable_id"], name: "index_admin_notifications_on_notifiable_type_and_notifiable_id"
  end

  create_table "business_accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_business_accounts_on_email", unique: true
  end

  create_table "business_profiles", force: :cascade do |t|
    t.bigint "account_id"
    t.string "name"
    t.integer "industry"
    t.integer "employees_range"
    t.integer "population_daily_approx"
    t.string "contact_person"
    t.string "contact_number"
    t.string "establishment_photo"
    t.string "address"
    t.integer "city_town"
    t.string "postal_code"
    t.string "landmark"
    t.float "lat"
    t.float "lng"
    t.string "qr_code"
    t.string "qr_file"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_business_profiles_on_account_id"
  end

  create_table "business_reservations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "code"
    t.integer "status", limit: 2, default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "activities", "accounts"
end
