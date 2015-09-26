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

ActiveRecord::Schema.define(version: 20150925212927) do

  create_table "component_shrinkages", force: true do |t|
    t.string   "component_type", limit: 30, null: false
    t.decimal  "shrinkage",                 null: false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "deleter_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "formula_components", force: true do |t|
    t.string   "formula_number",         limit: 15, null: false
    t.string   "formula_description",    limit: 50
    t.integer  "master_formula_id",                 null: false
    t.decimal  "blend_percentage"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "deleter_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "component_shrinkage_id"
  end

  create_table "item_masters", force: true do |t|
    t.string   "item_number",                                                             null: false
    t.string   "upc"
    t.string   "description"
    t.integer  "units_per_case"
    t.decimal  "weight",                          precision: 9, scale: 3
    t.string   "cid"
    t.string   "customer_item_number"
    t.integer  "pallet_height"
    t.integer  "cases_per_layer"
    t.integer  "master_formula_id",                                                       null: false
    t.boolean  "active",                                                  default: false, null: false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "deleter_id"
    t.datetime "created_at",                                                              null: false
    t.datetime "updated_at",                                                              null: false
    t.string   "gtin",                 limit: 14
  end

  create_table "master_formulas", force: true do |t|
    t.string   "formula_number",      null: false
    t.string   "formula_description"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "deleter_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "production_schedules", force: true do |t|
    t.datetime "production_date", null: false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
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
    t.string   "unconfirmed_email"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

end
