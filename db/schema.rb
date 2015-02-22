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

ActiveRecord::Schema.define(version: 20150222160110) do

  create_table "images", force: :cascade do |t|
    t.string   "image_url",  limit: 255
    t.integer  "product_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "option_products", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "options", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "product_id",        limit: 255
    t.string   "integer",           limit: 255
    t.string   "user_id",           limit: 255
    t.string   "quantity",          limit: 255
    t.string   "product_option_id", limit: 255
    t.decimal  "subtotal",                      precision: 10
    t.decimal  "tax",                           precision: 10
    t.decimal  "total",                         precision: 10
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "product_options", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id", limit: 4
  end

  create_table "products", force: :cascade do |t|
    t.decimal  "price",                     precision: 7, scale: 2
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.string   "category",    limit: 255
    t.string   "brand",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vendor_id",   limit: 4
    t.string   "image",       limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vendors", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "phone",      limit: 255
  end

end