ActiveRecord::Schema.define(version: 2021_09_07_213852) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messagecommits", force: :cascade do |t|
    t.text "content", null: false
    t.string "traceur"
    t.string "statut", default: "standby"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "message_id"
    t.index ["message_id"], name: "index_messagecommits_on_message_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content", null: false
    t.string "traceur"
    t.string "statut", default: "standby"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messagecommits", "messages"
end
