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

ActiveRecord::Schema.define(version: 20130930035203) do

  create_table "active_admin_comments", force: true do |t|
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

  create_table "ad_channels", force: true do |t|
    t.string   "chname"
    t.string   "chvalue"
    t.string   "chdescrip",  default: "default description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ad_stats", force: true do |t|
    t.integer  "adid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "adcount"
    t.string   "adaction"
    t.string   "adchannel",  default: "default"
  end

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "apk_ads", force: true do |t|
    t.string   "pkg_name"
    t.string   "pic_url"
    t.string   "pkg_url"
    t.string   "status",      default: "test"
    t.float    "weight",      default: 1.0
    t.string   "allowmobile", default: "yes"
    t.float    "size"
    t.float    "price"
    t.string   "ad_type",     default: "chap"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "imei"
    t.string   "sn"
    t.string   "androidid"
    t.string   "location"
    t.text     "pkgs"
    t.string   "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
