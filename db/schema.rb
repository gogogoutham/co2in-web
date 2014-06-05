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

ActiveRecord::Schema.define(version: 20140604195526) do

  create_table "price_lists", force: true do |t|
    t.datetime "creationtime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "snack_quotes", force: true do |t|
    t.decimal  "price"
    t.integer  "snack_id"
    t.integer  "price_list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "deposit_address"
  end

  add_index "snack_quotes", ["price_list_id"], name: "index_snack_quotes_on_price_list_id"
  add_index "snack_quotes", ["snack_id"], name: "index_snack_quotes_on_snack_id"

  create_table "snacks", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
