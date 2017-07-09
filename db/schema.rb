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

ActiveRecord::Schema.define(version: 20170708233838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analyses", force: :cascade do |t|
    t.integer  "property_id"
    t.string   "codeanalysis"
    t.date     "collect"
    t.decimal  "fat",             precision: 10, scale: 2
    t.decimal  "protein",         precision: 10, scale: 2
    t.decimal  "lactose",         precision: 10, scale: 2
    t.decimal  "totalsolids",     precision: 10, scale: 2
    t.decimal  "defattedextract", precision: 10, scale: 2
    t.decimal  "css"
    t.decimal  "scorecss"
    t.decimal  "ufc"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "analyses", ["property_id"], name: "index_analyses_on_property_id", using: :btree

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
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "property_id"
    t.integer  "reproduction_id"
    t.boolean  "donor",              default: false
  end

  add_index "animals", ["lot_id"], name: "index_animals_on_lot_id", using: :btree
  add_index "animals", ["property_id"], name: "index_animals_on_property_id", using: :btree
  add_index "animals", ["reproduction_id"], name: "index_animals_on_reproduction_id", using: :btree
  add_index "animals", ["user_id"], name: "index_animals_on_user_id", using: :btree

  create_table "batchanimals", force: :cascade do |t|
    t.integer  "animal_id"
    t.integer  "batch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "batchanimals", ["animal_id"], name: "index_batchanimals_on_animal_id", using: :btree
  add_index "batchanimals", ["batch_id"], name: "index_batchanimals_on_batch_id", using: :btree

  create_table "batches", force: :cascade do |t|
    t.string   "name"
    t.text     "observation"
    t.integer  "type"
    t.date     "formation"
    t.integer  "glebe_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "batches", ["glebe_id"], name: "index_batches_on_glebe_id", using: :btree
  add_index "batches", ["user_id"], name: "index_batches_on_user_id", using: :btree

  create_table "bins", force: :cascade do |t|
    t.decimal  "capacity",    precision: 10, scale: 2
    t.integer  "property_id"
    t.integer  "kind"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "bins", ["property_id"], name: "index_bins_on_property_id", using: :btree

  create_table "closes", force: :cascade do |t|
    t.datetime "dateclosing"
    t.decimal  "totalvalue",  precision: 10, scale: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "user_id"
  end

  add_index "closes", ["user_id"], name: "index_closes_on_user_id", using: :btree

  create_table "developments", force: :cascade do |t|
    t.decimal  "weight",     precision: 10, scale: 2
    t.decimal  "height",     precision: 10, scale: 2
    t.integer  "animal_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "developments", ["animal_id"], name: "index_developments_on_animal_id", using: :btree

  create_table "diets", force: :cascade do |t|
    t.decimal  "amount",     precision: 10, scale: 2
    t.datetime "datestart"
    t.datetime "dateend"
    t.integer  "animal_id"
    t.integer  "stock_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "diets", ["animal_id"], name: "index_diets_on_animal_id", using: :btree
  add_index "diets", ["stock_id"], name: "index_diets_on_stock_id", using: :btree

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
    t.decimal  "salary",      precision: 10, scale: 2
    t.string   "profession"
    t.integer  "payment"
    t.integer  "property_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "employees", ["property_id"], name: "index_employees_on_property_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "repeat"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "feeds", force: :cascade do |t|
    t.integer  "kind"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "financials", force: :cascade do |t|
    t.decimal  "value",           precision: 10, scale: 2
    t.datetime "datetransaction"
    t.integer  "operation"
    t.text     "description"
    t.integer  "animal_id"
    t.integer  "service_id"
    t.integer  "employee_id"
    t.integer  "reproduction_id"
    t.integer  "stock_id"
    t.integer  "treatment_id"
    t.integer  "shipment_id"
    t.integer  "schedule_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "user_id"
    t.integer  "close_id"
    t.decimal  "valor_litro",     precision: 10, scale: 2
    t.decimal  "b_bacteria",      precision: 10, scale: 2
    t.decimal  "b_ccs",           precision: 10, scale: 2
    t.decimal  "b_gordura",       precision: 10, scale: 2
    t.decimal  "b_tanque",        precision: 10, scale: 2
    t.decimal  "b_canalizacao",   precision: 10, scale: 2
    t.decimal  "b_frete",         precision: 10, scale: 2
    t.decimal  "b_compra",        precision: 10, scale: 2
  end

  add_index "financials", ["animal_id"], name: "index_financials_on_animal_id", using: :btree
  add_index "financials", ["close_id"], name: "index_financials_on_close_id", using: :btree
  add_index "financials", ["employee_id"], name: "index_financials_on_employee_id", using: :btree
  add_index "financials", ["reproduction_id"], name: "index_financials_on_reproduction_id", using: :btree
  add_index "financials", ["schedule_id"], name: "index_financials_on_schedule_id", using: :btree
  add_index "financials", ["service_id"], name: "index_financials_on_service_id", using: :btree
  add_index "financials", ["shipment_id"], name: "index_financials_on_shipment_id", using: :btree
  add_index "financials", ["stock_id"], name: "index_financials_on_stock_id", using: :btree
  add_index "financials", ["treatment_id"], name: "index_financials_on_treatment_id", using: :btree
  add_index "financials", ["user_id"], name: "index_financials_on_user_id", using: :btree

  create_table "glebes", force: :cascade do |t|
    t.string   "name"
    t.integer  "purpose"
    t.decimal  "area",        precision: 10, scale: 2
    t.integer  "property_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.boolean  "inactive",                             default: false
  end

  add_index "glebes", ["property_id"], name: "index_glebes_on_property_id", using: :btree

  create_table "illnesses", force: :cascade do |t|
    t.date     "startdate"
    t.date     "enddate"
    t.text     "sequel"
    t.integer  "animal_id"
    t.integer  "disease_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "illnesses", ["animal_id"], name: "index_illnesses_on_animal_id", using: :btree
  add_index "illnesses", ["disease_id"], name: "index_illnesses_on_disease_id", using: :btree

  create_table "lots", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "lots", ["property_id"], name: "index_lots_on_property_id", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "read"
    t.datetime "limit"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "productions", force: :cascade do |t|
    t.decimal  "amount",      precision: 10, scale: 2
    t.datetime "measurement"
    t.text     "observation"
    t.integer  "animal_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "productions", ["animal_id"], name: "index_productions_on_animal_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "long"
    t.string   "lat"
    t.integer  "user_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.decimal  "area",                 precision: 10, scale: 2
    t.decimal  "altitude"
    t.decimal  "precipitation"
    t.integer  "enrolement_of_sanity"
    t.string   "nirf"
    t.string   "incra"
    t.string   "state_registration"
    t.string   "manager"
  end

  add_index "properties", ["user_id"], name: "index_properties_on_user_id", using: :btree

  create_table "reproductions", force: :cascade do |t|
    t.date     "heat"
    t.date     "insemination"
    t.date     "regress"
    t.date     "abortion"
    t.date     "stop_breastfeeding"
    t.date     "parturition"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "father_id"
    t.integer  "mother_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "batch_id"
    t.datetime "datestart"
    t.datetime "dateend"
    t.text     "observation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "schedules", ["batch_id"], name: "index_schedules_on_batch_id", using: :btree
  add_index "schedules", ["event_id"], name: "index_schedules_on_event_id", using: :btree
  add_index "schedules", ["user_id"], name: "index_schedules_on_user_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "provider"
    t.string   "goal"
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "services", ["property_id"], name: "index_services_on_property_id", using: :btree
  add_index "services", ["user_id"], name: "index_services_on_user_id", using: :btree

  create_table "shipments", force: :cascade do |t|
    t.decimal  "amount",       precision: 10, scale: 2
    t.datetime "date"
    t.integer  "property_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "financial_id"
  end

  add_index "shipments", ["financial_id"], name: "index_shipments_on_financial_id", using: :btree
  add_index "shipments", ["property_id"], name: "index_shipments_on_property_id", using: :btree

  create_table "stocks", force: :cascade do |t|
    t.integer  "bin_id"
    t.integer  "feed_id"
    t.integer  "glebe_id"
    t.string   "fournisseur"
    t.decimal  "amount",      precision: 10, scale: 2
    t.decimal  "density",     precision: 10, scale: 2
    t.datetime "datestock"
    t.datetime "datestart"
    t.datetime "dateend"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "stocks", ["bin_id"], name: "index_stocks_on_bin_id", using: :btree
  add_index "stocks", ["feed_id"], name: "index_stocks_on_feed_id", using: :btree
  add_index "stocks", ["glebe_id"], name: "index_stocks_on_glebe_id", using: :btree

  create_table "treatments", force: :cascade do |t|
    t.date     "startdate"
    t.date     "enddate"
    t.decimal  "dosage",      precision: 10, scale: 2
    t.integer  "lack"
    t.text     "observation"
    t.integer  "illness_id"
    t.integer  "drug_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "treatments", ["drug_id"], name: "index_treatments_on_drug_id", using: :btree
  add_index "treatments", ["illness_id"], name: "index_treatments_on_illness_id", using: :btree

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

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "analyses", "properties"
  add_foreign_key "animals", "lots"
  add_foreign_key "animals", "properties"
  add_foreign_key "animals", "reproductions"
  add_foreign_key "animals", "users"
  add_foreign_key "batchanimals", "animals"
  add_foreign_key "batchanimals", "batches"
  add_foreign_key "batches", "glebes"
  add_foreign_key "batches", "users"
  add_foreign_key "bins", "properties"
  add_foreign_key "closes", "users"
  add_foreign_key "developments", "animals"
  add_foreign_key "diets", "animals"
  add_foreign_key "diets", "stocks"
  add_foreign_key "employees", "properties"
  add_foreign_key "events", "users"
  add_foreign_key "financials", "animals"
  add_foreign_key "financials", "closes"
  add_foreign_key "financials", "employees"
  add_foreign_key "financials", "reproductions"
  add_foreign_key "financials", "schedules"
  add_foreign_key "financials", "services"
  add_foreign_key "financials", "shipments"
  add_foreign_key "financials", "stocks"
  add_foreign_key "financials", "treatments"
  add_foreign_key "financials", "users"
  add_foreign_key "glebes", "properties"
  add_foreign_key "illnesses", "animals"
  add_foreign_key "illnesses", "diseases"
  add_foreign_key "lots", "properties"
  add_foreign_key "notifications", "users"
  add_foreign_key "productions", "animals"
  add_foreign_key "properties", "users"
  add_foreign_key "schedules", "batches"
  add_foreign_key "schedules", "events"
  add_foreign_key "schedules", "users"
  add_foreign_key "services", "properties"
  add_foreign_key "services", "users"
  add_foreign_key "shipments", "financials"
  add_foreign_key "shipments", "properties"
  add_foreign_key "stocks", "bins"
  add_foreign_key "stocks", "feeds"
  add_foreign_key "stocks", "glebes"
  add_foreign_key "treatments", "drugs"
  add_foreign_key "treatments", "illnesses"
end
