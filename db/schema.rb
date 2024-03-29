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

ActiveRecord::Schema.define(version: 2021_12_07_113525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "attraction_members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "attraction_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attraction_id"], name: "index_attraction_members_on_attraction_id"
    t.index ["user_id"], name: "index_attraction_members_on_user_id"
  end

  create_table "attractions", force: :cascade do |t|
    t.text "description"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mentions", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_mentions_on_post_id"
    t.index ["user_id"], name: "index_mentions_on_user_id"
  end

  create_table "post_referrers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.integer "count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_post_referrers_on_post_id"
    t.index ["user_id"], name: "index_post_referrers_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.boolean "published"
    t.integer "visits"
    t.bigint "user_id", null: false
    t.bigint "attraction_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.index ["attraction_id"], name: "index_posts_on_attraction_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "short_link_posts", force: :cascade do |t|
    t.bigint "short_link_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_short_link_posts_on_post_id"
    t.index ["short_link_id"], name: "index_short_link_posts_on_short_link_id"
  end

  create_table "short_link_referrers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "short_link_id", null: false
    t.integer "count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["short_link_id"], name: "index_short_link_referrers_on_short_link_id"
    t.index ["user_id"], name: "index_short_link_referrers_on_user_id"
  end

  create_table "short_links", force: :cascade do |t|
    t.text "long_url"
    t.text "short_url"
    t.bigint "user_id", null: false
    t.bigint "attraction_id", null: false
    t.integer "clicks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.index ["attraction_id"], name: "index_short_links_on_attraction_id"
    t.index ["user_id"], name: "index_short_links_on_user_id"
  end

  create_table "slack_channels", force: :cascade do |t|
    t.bigint "attraction_id", null: false
    t.string "slack_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attraction_id"], name: "index_slack_channels_on_attraction_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "referrer_code"
    t.string "name"
    t.string "first_name"
    t.string "username"
    t.string "slack_id"
    t.text "bio"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attraction_members", "attractions"
  add_foreign_key "attraction_members", "users"
  add_foreign_key "mentions", "posts"
  add_foreign_key "mentions", "users"
  add_foreign_key "post_referrers", "posts"
  add_foreign_key "post_referrers", "users"
  add_foreign_key "posts", "attractions"
  add_foreign_key "posts", "users"
  add_foreign_key "short_link_posts", "posts"
  add_foreign_key "short_link_posts", "short_links"
  add_foreign_key "short_link_referrers", "short_links"
  add_foreign_key "short_link_referrers", "users"
  add_foreign_key "short_links", "attractions"
  add_foreign_key "short_links", "users"
  add_foreign_key "slack_channels", "attractions"
end
