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

ActiveRecord::Schema.define(version: 20170310021414) do

  create_table "animals", force: :cascade do |t|
    t.integer  "code"
    t.string   "name"
    t.string   "description"
    t.date     "discard"
    t.string   "reason_discard"
    t.boolean  "female"
    t.integer  "breed"
    t.integer  "lot_id"
    t.integer  "user_id"
    t.integer  "reproduction_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "animals", ["lot_id"], name: "index_animals_on_lot_id"
  add_index "animals", ["reproduction_id"], name: "index_animals_on_reproduction_id"
  add_index "animals", ["user_id"], name: "index_animals_on_user_id"

  create_table "developments", force: :cascade do |t|
    t.float    "weight"
    t.float    "height"
    t.integer  "animal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "developments", ["animal_id"], name: "index_developments_on_animal_id"

  create_table "diseases", force: :cascade do |t|
    t.string   "vulgarname"
    t.string   "cientificname"
    t.text     "causes"
    t.text     "description"
    t.text     "symptoms"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "drugs", force: :cascade do |t|
    t.string   "name"
    t.string   "laboratory"
    t.string   "reference"
    t.text     "presentation"
    t.text     "use"
    t.text     "composition"
    t.text     "indication"
    t.text     "contraindication"
    t.text     "warning"
    t.text     "interaction"
    t.text     "effect"
    t.text     "dosage"
    t.text     "overdosage"
    t.text     "properties"
    t.text     "species"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "work"
    t.string   "name"
    t.date     "startwork"
    t.date     "endwork"
    t.date     "born"
    t.string   "phone"
    t.string   "rg"
    t.string   "cpf"
    t.integer  "schooling"
    t.integer  "inss"
    t.integer  "pis"
    t.decimal  "salary"
    t.string   "profession"
    t.integer  "payment"
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "employees", ["property_id"], name: "index_employees_on_property_id"

  create_table "glebes", force: :cascade do |t|
    t.string   "name"
    t.integer  "purpose"
    t.decimal  "area"
    t.integer  "property_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "inactive",    default: false
  end

  add_index "glebes", ["property_id"], name: "index_glebes_on_property_id"

  create_table "illnesses", force: :cascade do |t|
    t.date     "startdate"
    t.date     "enddate"
    t.text     "sequel"
    t.integer  "animal_id"
    t.integer  "disease_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "illnesses", ["animal_id"], name: "index_illnesses_on_animal_id"
  add_index "illnesses", ["disease_id"], name: "index_illnesses_on_disease_id"

  create_table "lots", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "lots", ["property_id"], name: "index_lots_on_property_id"

  create_table "notifications", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "read"
    t.datetime "limit"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "productions", force: :cascade do |t|
    t.float    "amount"
    t.datetime "measurement"
    t.text     "observation"
    t.integer  "animal_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "productions", ["animal_id"], name: "index_productions_on_animal_id"

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
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.decimal  "area"
    t.decimal  "altitude"
    t.decimal  "precipitation"
    t.integer  "enrolement_of_sanity"
    t.string   "nirf"
    t.string   "incra"
    t.string   "state_registration"
    t.string   "manager"
  end

  add_index "properties", ["user_id"], name: "index_properties_on_user_id"

  create_table "reproductions", force: :cascade do |t|
    t.date     "heat"
    t.date     "insemination"
    t.date     "regress"
    t.date     "abortion"
    t.date     "stop_breastfeeding"
    t.date     "parturition"
    t.integer  "animal_id"
    t.integer  "father_id"
    t.integer  "mother_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "reproductions", ["animal_id"], name: "index_reproductions_on_animal_id"
  add_index "reproductions", ["father_id"], name: "index_reproductions_on_father_id"
  add_index "reproductions", ["mother_id"], name: "index_reproductions_on_mother_id"

  create_table "treatments", force: :cascade do |t|
    t.date     "startdate"
    t.date     "enddate"
    t.decimal  "dosage"
    t.integer  "lack"
    t.text     "observation"
    t.integer  "illness_id"
    t.integer  "drug_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "treatments", ["drug_id"], name: "index_treatments_on_drug_id"
  add_index "treatments", ["illness_id"], name: "index_treatments_on_illness_id"

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
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",                     null: false
    t.integer  "item_id",                       null: false
    t.string   "event",                         null: false
    t.string   "whodunnit"
    t.text     "object",     limit: 1073741823
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end
