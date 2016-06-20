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

ActiveRecord::Schema.define(version: 20160620010332) do

  create_table "animals", force: :cascade do |t|
    t.integer  "code"
    t.string   "name"
    t.string   "description"
    t.date     "born"
    t.boolean  "female"
    t.string   "breed"
    t.integer  "lot_id"
    t.integer  "reproduction_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "animals", ["lot_id"], name: "index_animals_on_lot_id"
  add_index "animals", ["reproduction_id"], name: "index_animals_on_reproduction_id"

  create_table "lots", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "lots", ["property_id"], name: "index_lots_on_property_id"

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.float    "long"
    t.float    "lat"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reproductions", force: :cascade do |t|
    t.date     "heat"
    t.date     "insemination"
    t.date     "regress"
    t.date     "abortion"
    t.date     "parturition"
    t.integer  "animal_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "reproductions", ["animal_id"], name: "index_reproductions_on_animal_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.date     "born"
    t.string   "cpf"
    t.string   "rg"
    t.string   "address"
    t.string   "city"
    t.string   "language"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
