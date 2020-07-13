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

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "lastname"
    t.string "firstname"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "leads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "FullName"
    t.string "CompagnyName"
    t.string "Email"
    t.string "Phone"
    t.string "ProjectName"
    t.string "ProjectDesc"
    t.string "text"
    t.string "Departement"
    t.text "Message"
    t.binary "AttachedFile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "fullname"
    t.string "email"
    t.string "phone"
    t.string "businessname"
    t.string "projectname"
    t.string "buildingtype"
    t.string "quality"
    t.integer "nbapartment"
    t.integer "nbfloor"
    t.integer "nbbasement"
    t.integer "nbbusiness"
    t.integer "nbparking"
    t.integer "nbshaft"
    t.integer "nboccupant"
    t.integer "nbcompanies"
    t.integer "activehours"
    t.integer "nbelevator"
    t.string "elevatorprice"
    t.string "subtotal"
    t.string "installfee"
    t.string "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customers", "Adresses"
  add_foreign_key "customers", "Users"
  add_foreign_key "employees", "users"
end
