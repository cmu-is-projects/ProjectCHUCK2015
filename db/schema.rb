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

ActiveRecord::Schema.define(version: 20150217022406) do

  create_table "games", force: true do |t|
    t.integer  "team1_score"
    t.integer  "team2_score"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "zip"
    t.string   "state"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", force: true do |t|
    t.integer  "student_id"
    t.integer  "bracket_id"
    t.boolean  "has_report_card"
    t.boolean  "has_proof_of_insurance"
    t.string   "insurance_provider"
    t.string   "insurance_policy_no"
    t.string   "family_physician"
    t.string   "physician_phone"
    t.boolean  "has_physical"
    t.boolean  "physical_date"
    t.string   "jersey_size"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.integer  "household_id"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.string   "cell_phone"
    t.string   "email"
    t.integer  "grade"
    t.string   "gender"
    t.string   "emergency_contact_name"
    t.string   "emergency_contact_phone"
    t.boolean  "has_birth_certificate"
    t.text     "allergies"
    t.text     "medications"
    t.text     "security_question"
    t.text     "security_response"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_games", force: true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "role"
    t.string   "email"
    t.boolean  "active"
    t.string   "password_digest"
    t.date     "active_after"
    t.string   "password_reset_token"
    t.date     "password_reset_sent_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "cell_phone"
    t.boolean  "receives_text_msgs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
