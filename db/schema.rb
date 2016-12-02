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

ActiveRecord::Schema.define(version: 20161202163302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "linked_in"
    t.string   "twitter"
    t.string   "other"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contacts_on_user_id", using: :btree
  end

  create_table "month_contacts", force: :cascade do |t|
    t.integer "month_id"
    t.integer "contact_id"
    t.index ["contact_id"], name: "index_month_contacts_on_contact_id", using: :btree
    t.index ["month_id"], name: "index_month_contacts_on_month_id", using: :btree
  end

  create_table "months", force: :cascade do |t|
    t.string  "name"
    t.string  "method",       default: "n/a"
    t.string  "date",         default: "2016-12-02 16:36:01.884887"
    t.integer "meeting",      default: 0
    t.string  "meeting_date", default: "2016-12-02 16:36:01.889994"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "password_confirmation"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_foreign_key "contacts", "users"
  add_foreign_key "month_contacts", "contacts"
  add_foreign_key "month_contacts", "months"
end
