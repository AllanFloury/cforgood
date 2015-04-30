# encoding: UTF-8
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


ActiveRecord::Schema.define(version: 20150430133354) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "business_labels", force: :cascade do |t|
    t.integer  "business_id"
    t.integer  "label_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "business_labels", ["business_id"], name: "index_business_labels_on_business_id", using: :btree
  add_index "business_labels", ["label_id"], name: "index_business_labels_on_label_id", using: :btree

  create_table "businesses", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "street"
    t.string   "zipcode"
    t.string   "city"
    t.string   "url"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "category_id"
    t.string   "telephone"
    t.string   "email"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "businesses", ["category_id"], name: "index_businesses_on_category_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "perk_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "perk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "perk_requests", ["perk_id"], name: "index_perk_requests_on_perk_id", using: :btree
  add_index "perk_requests", ["user_id"], name: "index_perk_requests_on_user_id", using: :btree

  create_table "perks", force: :cascade do |t|
    t.string   "title"
    t.text     "details"
    t.integer  "business_id"
    t.datetime "created_at",                  null:    false
    t.datetime "updated_at",                  null:    false
    t.boolean  "state",                       default: false
  end

  add_index "perks", ["business_id"], name: "index_perks_on_business_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "zipcode"
    t.string   "city"
    t.boolean  "admin",                  default: false, null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "business_labels", "businesses"
  add_foreign_key "business_labels", "labels"
  add_foreign_key "businesses", "categories"
  add_foreign_key "perk_requests", "perks"
  add_foreign_key "perk_requests", "users"
  add_foreign_key "perks", "businesses"
end
