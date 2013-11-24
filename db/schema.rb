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

ActiveRecord::Schema.define(version: 20131124014223) do

  create_table "item_menus", force: true do |t|
    t.string  "item_name"
    t.string  "item_category"
    t.string  "item_picture"
    t.string  "item_description"
    t.float   "item_price"
    t.boolean "monday"
    t.boolean "tuesday"
    t.boolean "wednesday"
    t.boolean "thursday"
    t.boolean "friday"
    t.boolean "saturday"
    t.boolean "sunday"
  end

  create_table "order_menus", force: true do |t|
    t.integer "item_quantity"
    t.integer "order_id"
    t.integer "item_menu_id"
  end

  create_table "order_summaries", force: true do |t|
    t.integer "user_id"
    t.string  "order_status"
    t.date    "order_date"
    t.float   "order_total"
  end

  create_table "users", force: true do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
  end

end
