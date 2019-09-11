ActiveRecord::Schema.define(version: 2019_09_11_004129) do

  enable_extension "plpgsql"

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "hours"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "opt_in", default: true
    t.string "provider"
    t.string "uid"
    t.string "token"
    t.integer "expires_at"
    t.boolean "expires"
    t.string "refresh_token"
    t.integer "country_code", default: 1
    t.string "authy_id"
    t.boolean "verified", default: false
    t.bigint "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
