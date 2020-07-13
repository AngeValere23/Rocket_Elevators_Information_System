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

ActiveRecord::Schema.define(version: 2020_07_13_180303) do

  create_table "adresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "TypeOfAdress"
    t.string "Status"
    t.string "Entity"
    t.string "NumberAndStreet"
    t.string "string"
    t.string "SuiteOrApart"
    t.string "integer"
    t.string "City"
    t.string "PostalCode"
    t.string "Country"
    t.text "Notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "User_id"
    t.string "CompanyName"
    t.bigint "Adress_id"
    t.string "FullNameOfContact"
    t.string "CompanyPhone"
    t.string "EmailOfContact"
    t.string "FullNameOfServiceTechAutority"
    t.string "TechnicalAutorityPhone"
    t.string "TechnicalManagerEmail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Adress_id"], name: "index_customers_on_Adress_id"
    t.index ["User_id"], name: "index_customers_on_User_id"
  end

# Could not dump table "employees" because of following ActiveRecord::StatementInvalid
#   Mysql2::Error::ConnectionError: Lost connection to MySQL server during query: SHOW CREATE TABLE `employees`

