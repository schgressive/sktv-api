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

ActiveRecord::Schema.define(version: 20180712174157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agents", force: :cascade do |t|
    t.string   "name"
    t.string   "age"
    t.string   "phone"
    t.string   "email"
    t.string   "webpage"
    t.string   "instagram"
    t.string   "photo_url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "facebook"
    t.string   "youtube"
    t.string   "quote"
    t.string   "text"
    t.string   "featured_image"
    t.string   "agent_type"
    t.string   "aditional_text"
    t.string   "youtube_id"
  end

  create_table "banners", force: :cascade do |t|
    t.string  "image_url"
    t.string  "name"
    t.string  "link"
    t.boolean "active",         default: true
    t.boolean "is_agency"
    t.boolean "show_home"
    t.boolean "show_novedades"
    t.boolean "show_galeria"
    t.boolean "show_agents"
    t.boolean "show_map"
    t.boolean "secondary",      default: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "place"
    t.string   "map_url"
    t.string   "code_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "image_url"
    t.date     "release_date"
    t.string   "text"
    t.string   "featured_image"
  end

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "description"
    t.string   "text1"
    t.string   "text2"
    t.string   "image_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "featured"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "photo_url"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "filename"
    t.integer  "order"
    t.integer  "post_id"
    t.string   "caption"
    t.integer  "agent_id"
    t.integer  "spot_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "intro"
    t.string   "text"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "featured"
    t.string   "subtitle"
    t.string   "second_text"
    t.string   "image_url"
    t.date     "release_date"
    t.string   "place"
    t.integer  "flaitometro"
    t.string   "youtube_url"
    t.boolean  "is_cover"
    t.boolean  "recommended"
  end

  create_table "spots", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "map_url"
    t.string   "image_url"
    t.string   "city"
    t.string   "region"
    t.string   "address"
    t.string   "commment"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "flaitometro"
    t.string   "aditional_text"
    t.string   "flaitometro_text"
    t.string   "youtube_url"
    t.string   "caption"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
