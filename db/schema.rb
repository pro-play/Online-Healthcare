# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_03_040931) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "doctorappoints", force: :cascade do |t|
    t.string "notes"
    t.integer "patient_id", null: false
    t.integer "doctor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "patientName"
    t.index ["doctor_id"], name: "index_doctorappoints_on_doctor_id"
    t.index ["patient_id"], name: "index_doctorappoints_on_patient_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "doctor_name"
    t.string "address"
    t.string "department"
    t.string "qualification"
    t.date "dob"
    t.boolean "gender"
    t.string "email"
    t.string "password_digest"
    t.integer "phone"
    t.integer "hospital_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "hospital_name"
    t.index ["hospital_id"], name: "index_doctors_on_hospital_id"
  end

  create_table "doctorseeks", force: :cascade do |t|
    t.string "notes"
    t.string "doctor_name"
    t.integer "patient_id", null: false
    t.integer "doctor_id", null: false
    t.integer "doctorappoint_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_doctorseeks_on_doctor_id"
    t.index ["doctorappoint_id"], name: "index_doctorseeks_on_doctorappoint_id"
    t.index ["patient_id"], name: "index_doctorseeks_on_patient_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "hospital_name"
    t.string "address"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "patient_name"
    t.string "address"
    t.boolean "gender"
    t.date "dob"
    t.string "email"
    t.string "password_digest"
    t.integer "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "department"
  end

  create_table "patienttells", force: :cascade do |t|
    t.string "notes"
    t.string "patient_name"
    t.integer "patient_id", null: false
    t.integer "doctor_id", null: false
    t.integer "doctorappoint_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_patienttells_on_doctor_id"
    t.index ["doctorappoint_id"], name: "index_patienttells_on_doctorappoint_id"
    t.index ["patient_id"], name: "index_patienttells_on_patient_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.string "notes"
    t.integer "patient_id", null: false
    t.integer "doctor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "doctorName"
    t.index ["doctor_id"], name: "index_prescriptions_on_doctor_id"
    t.index ["patient_id"], name: "index_prescriptions_on_patient_id"
  end

  create_table "previousrecords", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "doctor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "patient_name"
    t.string "doctorName"
    t.string "symptoms"
    t.string "notes"
    t.index ["doctor_id"], name: "index_previousrecords_on_doctor_id"
    t.index ["patient_id"], name: "index_previousrecords_on_patient_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "doctorappoints", "doctors"
  add_foreign_key "doctorappoints", "patients"
  add_foreign_key "doctors", "hospitals"
  add_foreign_key "doctorseeks", "doctorappoints"
  add_foreign_key "doctorseeks", "doctors"
  add_foreign_key "doctorseeks", "patients"
  add_foreign_key "patienttells", "doctorappoints"
  add_foreign_key "patienttells", "doctors"
  add_foreign_key "patienttells", "patients"
  add_foreign_key "prescriptions", "doctors"
  add_foreign_key "prescriptions", "patients"
  add_foreign_key "previousrecords", "doctors"
  add_foreign_key "previousrecords", "patients"
end
