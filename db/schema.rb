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

ActiveRecord::Schema.define(version: 20161029193420) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.text    "title",           null: false
    t.integer "author_id",       null: false
    t.integer "cuisine_id"
    t.string  "time_to_prepare"
    t.text    "content"
  end

  add_index "articles", ["cuisine_id"], name: "index_articles_on_cuisine_id", using: :btree
  add_index "articles", ["time_to_prepare"], name: "index_articles_on_time_to_prepare", using: :btree
  add_index "articles", ["title"], name: "index_articles_on_title", using: :btree

  create_table "cuisines", force: :cascade do |t|
    t.string "name", null: false
  end

  add_index "cuisines", ["name"], name: "index_cuisines_on_name", using: :btree

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
    t.string   "name"
    t.string   "country"
    t.string   "phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer "entity_id",   null: false
    t.string  "entity_type", null: false
    t.integer "user_id",     null: false
  end

  add_index "votes", ["entity_id"], name: "index_votes_on_entity_id", using: :btree
  add_index "votes", ["entity_type"], name: "index_votes_on_entity_type", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
