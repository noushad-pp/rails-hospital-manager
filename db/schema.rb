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

ActiveRecord::Schema.define(version: 20180425094134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "admissions", force: :cascade do |t|
    t.bigint "patient_id"
    t.date "admission_date"
    t.date "discharge_date"
    t.bigint "room_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_admissions_on_patient_id"
    t.index ["room_id"], name: "index_admissions_on_room_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.string "url"
    t.string "title"
    t.string "attachable_type"
    t.bigint "attachable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable_type_and_attachable_id"
  end

  create_table "bill_items", force: :cascade do |t|
    t.string "type"
    t.float "rate"
    t.float "quantity"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bill_templates", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "image"
    t.string "gst_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bills", force: :cascade do |t|
    t.bigint "patient_id"
    t.integer "total"
    t.string "payment_status"
    t.float "discount"
    t.float "tax"
    t.bigint "bill_items_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_items_id"], name: "index_bills_on_bill_items_id"
    t.index ["patient_id"], name: "index_bills_on_patient_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnoses", force: :cascade do |t|
    t.string "symptoms"
    t.string "obserations"
    t.bigint "attachments_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachments_id"], name: "index_diagnoses_on_attachments_id"
  end

  create_table "employee_roles", force: :cascade do |t|
    t.string "name"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_employee_roles_on_department_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.bigint "department_id"
    t.string "employee_type"
    t.string "degrees"
    t.string "registration_no"
    t.float "consultation_charge"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.bigint "employee_role_id"
    t.date "joining_date"
    t.date "leaving_date"
    t.float "salary"
    t.string "additional_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["employee_role_id"], name: "index_employees_on_employee_role_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.string "registration_id"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.string "image"
    t.string "gst_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "gender"
    t.string "phone"
    t.string "address"
    t.date "dob"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prescriptions", force: :cascade do |t|
    t.string "prescription"
    t.integer "duration"
    t.bigint "attachments_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachments_id"], name: "index_prescriptions_on_attachments_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "room_type"
    t.float "charge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatment_records", force: :cascade do |t|
    t.string "type"
    t.bigint "patient_id"
    t.bigint "admission_id"
    t.bigint "employee_id"
    t.bigint "diagnosis_id"
    t.bigint "prescription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admission_id"], name: "index_treatment_records_on_admission_id"
    t.index ["diagnosis_id"], name: "index_treatment_records_on_diagnosis_id"
    t.index ["employee_id"], name: "index_treatment_records_on_employee_id"
    t.index ["patient_id"], name: "index_treatment_records_on_patient_id"
    t.index ["prescription_id"], name: "index_treatment_records_on_prescription_id"
  end

  add_foreign_key "admissions", "patients"
  add_foreign_key "admissions", "rooms"
  add_foreign_key "bills", "bill_items", column: "bill_items_id"
  add_foreign_key "bills", "patients"
  add_foreign_key "diagnoses", "attachments", column: "attachments_id"
  add_foreign_key "employee_roles", "departments"
  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "employee_roles"
  add_foreign_key "prescriptions", "attachments", column: "attachments_id"
  add_foreign_key "treatment_records", "admissions"
  add_foreign_key "treatment_records", "diagnoses"
  add_foreign_key "treatment_records", "employees"
  add_foreign_key "treatment_records", "patients"
  add_foreign_key "treatment_records", "prescriptions"
end
