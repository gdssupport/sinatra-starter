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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agents", force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.text "tel"
    t.text "email"
    t.text "password"
    t.text "user_name"
  end

  create_table "concepts", force: :cascade do |t|
    t.date    "orig_date"
    t.text    "destination"
    t.text    "trans_type"
    t.text    "type_desc"
    t.text    "rec_loc"
    t.date    "depart"
    t.date    "arrival"
    t.integer "total_cost"
    t.date    "due_date"
    t.integer "cust_id"
    t.text    "notes"
    t.date    "create_date"
    t.text    "user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.text    "first_name"
    t.text    "last_name"
    t.text    "tel"
    t.text    "email"
    t.text    "lead"
    t.text    "add_contact"
    t.text    "contact_tel"
    t.date    "created_at"
    t.integer "current_bal"
    t.date    "updated_at"
  end

  create_table "transactions", force: :cascade do |t|
    t.text    "cust_id"
    t.integer "concept_id"
    t.text    "pay_type"
    t.integer "amount"
    t.text    "approv_code"
    t.date    "trans_date"
    t.text    "trans_notes"
    t.text    "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.text "tel"
    t.text "email"
    t.text "password"
    t.text "username"
  end

end
