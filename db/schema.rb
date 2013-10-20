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

ActiveRecord::Schema.define(version: 20131016101103) do

  create_table "responses", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.string "status"
  end

  create_table "tickets", force: true do |t|
    t.string   "name",                   null: false
    t.string   "email",                  null: false
    t.text     "message",                null: false
    t.integer  "status_id",  default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tokens", force: true do |t|
    t.integer "task_id"
    t.string  "token"
  end

  create_table "users", force: true do |t|
    t.string "username"
    t.string "email"
    t.string "password_hash"
    t.string "password_salt"
  end

end
