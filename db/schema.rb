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

ActiveRecord::Schema.define(version: 2021_06_06_053516) do

  create_table "cement_unit_deployeds", force: :cascade do |t|
    t.string "vehicle_name"
    t.float "quantity"
    t.integer "deployment_order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deployment_order_id"], name: "index_cement_unit_deployeds_on_deployment_order_id"
  end

  create_table "deployment_orders", force: :cascade do |t|
    t.string "well_name"
    t.date "date_of_duty"
    t.time "departure_time"
    t.integer "rig_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "job_id"
    t.string "special_instruction"
    t.string "d_site_contact_no"
    t.string "route"
    t.string "job_ic"
  end

  create_table "head_parties", force: :cascade do |t|
    t.integer "staff_id"
    t.integer "deployment_order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deployment_order_id"], name: "index_head_parties_on_deployment_order_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "light_vehicals", force: :cascade do |t|
    t.string "vehical_no"
    t.integer "deployment_order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deployment_order_id"], name: "index_light_vehicals_on_deployment_order_id"
  end

  create_table "main_parties", force: :cascade do |t|
    t.integer "staff_id"
    t.integer "deployment_order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deployment_order_id"], name: "index_main_parties_on_deployment_order_id"
  end

  create_table "rigs", force: :cascade do |t|
    t.string "rig_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "unit_deployed_staffs", force: :cascade do |t|
    t.integer "staff_id"
    t.integer "unit_deployed_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["unit_deployed_id"], name: "index_unit_deployed_staffs_on_unit_deployed_id"
  end

  create_table "unit_deployeds", force: :cascade do |t|
    t.string "vehicle_name"
    t.integer "deployment_order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cement_unit_deployeds", "deployment_orders"
  add_foreign_key "head_parties", "deployment_orders"
  add_foreign_key "light_vehicals", "deployment_orders"
  add_foreign_key "main_parties", "deployment_orders"
  add_foreign_key "unit_deployed_staffs", "unit_deployeds"
end
