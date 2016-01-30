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

ActiveRecord::Schema.define(version: 20160129111642) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "accountType"
    t.float    "balance"
    t.float    "overdraft"
    t.string   "branchName"
    t.string   "address"
    t.date     "dob"
    t.string   "email"
    t.string   "postcode"
    t.string   "gender"
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "branches", force: :cascade do |t|
    t.string   "branchName"
    t.string   "branchLocation"
    t.string   "branchPostcode"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "fullname"
    t.string   "address"
    t.string   "phone"
    t.string   "employeeRole"
    t.string   "email"
    t.string   "branch"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "transType"
    t.string   "method"
    t.string   "description"
    t.float    "amount"
    t.integer  "account_id"
    t.integer  "employee_id"
		t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
