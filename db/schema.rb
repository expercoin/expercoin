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

ActiveRecord::Schema.define(version: 2018_07_05_081048) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.integer "parent_id"
    t.string "name"
    t.string "slug"
    t.text "description"
    t.text "banner"
    t.text "logo"
    t.text "hover_logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_profiles", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "profile_id", null: false
    t.index ["category_id", "profile_id"], name: "index_categories_profiles_on_category_id_and_profile_id", unique: true
    t.index ["profile_id", "category_id"], name: "index_categories_profiles_on_profile_id_and_category_id", unique: true
  end

  create_table "eth_addresses", force: :cascade do |t|
    t.text "public_key"
    t.integer "wallet_id"
    t.boolean "default", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wallet_id"], name: "index_eth_addresses_on_wallet_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "mail_records", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "sender_id"
    t.boolean "sent"
    t.text "body"
    t.text "meta"
    t.string "subject"
    t.string "mail_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.integer "parent_id"
    t.string "title"
    t.text "body"
    t.boolean "unread", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "oauth_accounts", force: :cascade do |t|
    t.integer "user_id"
    t.string "uid"
    t.string "provider"
    t.string "image_url"
    t.string "profile_url"
    t.string "access_token"
    t.text "raw_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_oauth_accounts_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "name"
    t.string "title"
    t.integer "expercoin_rate"
    t.integer "rate"
    t.string "professional_role"
    t.integer "years_of_experience"
    t.string "photo"
    t.string "slug"
    t.string "video_url"
    t.text "location"
    t.text "about"
    t.text "specialization"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "title"
    t.text "message"
    t.integer "session_length"
    t.integer "requested_length"
    t.string "cell_number"
    t.integer "country_number"
    t.date "first_date"
    t.date "second_date"
    t.date "third_date"
    t.string "first_time"
    t.string "second_time"
    t.string "third_time"
    t.datetime "selected_date"
    t.boolean "recording"
    t.integer "status", default: 0
    t.string "time_zone"
    t.string "room_sid"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer "requester_id"
    t.integer "expert_id"
    t.integer "updated_by_id"
    t.string "tx_hash"
    t.integer "service_id"
    t.decimal "requested_amount_eth", precision: 36, scale: 18
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "inviter", default: false
    t.boolean "invitee", default: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.string "message"
    t.integer "rate"
    t.integer "profile_id"
    t.integer "author_id"
    t.integer "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_providers", force: :cascade do |t|
    t.integer "service_id"
    t.integer "profile_id"
    t.boolean "featured", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_service_providers_on_profile_id"
    t.index ["service_id"], name: "index_service_providers_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "title"
    t.string "cover_image"
    t.string "slug"
    t.text "content"
    t.integer "category_id"
    t.integer "status"
    t.integer "owner_id"
    t.integer "expercoin_rate"
    t.integer "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_services_on_category_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "date"
    t.decimal "eth_amount", precision: 36, scale: 18
    t.integer "sender_id"
    t.integer "receiver_id"
    t.integer "parent_id"
    t.integer "request_id"
    t.integer "usd_amount"
    t.integer "status", default: 0
    t.text "from_eth"
    t.text "block_number"
    t.text "to_eth"
    t.text "tx_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tx_hash"], name: "index_transactions_on_tx_hash", unique: true
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_wallets_on_profile_id"
  end

end
