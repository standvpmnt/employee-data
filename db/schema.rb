# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_07_022340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "appraisal_histories", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.date "effective_date"
    t.string "last_designation"
    t.integer "last_salary"
    t.string "new_designation"
    t.integer "new_salary"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_appraisal_histories_on_employee_id"
  end

  create_table "asset_details", force: :cascade do |t|
    t.string "asset_category"
    t.string "identifier_type"
    t.boolean "enabled", default: true
  end

  create_table "assets", force: :cascade do |t|
    t.bigint "asset_detail_id", null: false
    t.string "asset_identifier"
    t.bigint "employee_id"
    t.string "note"
    t.string "updated_by"
    t.boolean "in_store", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["asset_detail_id"], name: "index_assets_on_asset_detail_id"
    t.index ["employee_id"], name: "index_assets_on_employee_id"
  end

  create_table "attendance_histories", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.integer "working_days"
    t.integer "sick_leaves", default: 0
    t.integer "casual_leaves", default: 0
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "week_offs", default: 0
    t.integer "half_days", default: 0
    t.index ["employee_id"], name: "index_attendance_histories_on_employee_id"
  end

  create_table "code_records", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.bigint "employee_id", null: false
    t.integer "employee_count"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_code_records_on_employee_id"
    t.index ["location_id"], name: "index_code_records_on_location_id"
  end

  create_table "document_types", force: :cascade do |t|
    t.string "document_category"
    t.boolean "enabled", default: true
  end

  create_table "documents", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "document_type_id", null: false
    t.index ["document_type_id"], name: "index_documents_on_document_type_id"
    t.index ["employee_id"], name: "index_documents_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.string "employee_code"
    t.string "name"
    t.date "dob"
    t.string "gender"
    t.string "current_designation"
    t.date "date_of_joining"
    t.string "blood_group"
    t.string "personal_contact_no"
    t.string "father_name"
    t.string "mother_name"
    t.string "emergency_contact_no"
    t.string "emergency_contact_name"
    t.string "emergency_contact_relation"
    t.string "personal_email"
    t.string "official_email"
    t.text "local_address"
    t.string "permanent_address"
    t.boolean "isManager"
    t.bigint "manager_id"
    t.date "date_of_leaving"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "notes"
    t.index ["location_id"], name: "index_employees_on_location_id"
    t.index ["manager_id"], name: "index_employees_on_manager_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "district"
    t.string "state"
    t.string "country"
    t.text "address"
    t.string "code"
    t.boolean "active", default: true
    t.string "pin_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posting_histories", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.bigint "employee_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_posting_histories_on_employee_id"
    t.index ["location_id"], name: "index_posting_histories_on_location_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appraisal_histories", "employees"
  add_foreign_key "assets", "asset_details"
  add_foreign_key "assets", "employees"
  add_foreign_key "attendance_histories", "employees"
  add_foreign_key "code_records", "employees"
  add_foreign_key "code_records", "locations"
  add_foreign_key "documents", "document_types"
  add_foreign_key "documents", "employees"
  add_foreign_key "employees", "locations"
  add_foreign_key "posting_histories", "employees"
  add_foreign_key "posting_histories", "locations"
end
