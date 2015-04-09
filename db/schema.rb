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

ActiveRecord::Schema.define(version: 20150409210037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brackets", force: true do |t|
    t.integer  "tournament_id"
    t.string   "gender"
    t.integer  "min_age"
    t.integer  "max_age"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "max_students"
  end

  create_table "games", force: true do |t|
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
  end

  create_table "guardians", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "household_id"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "cell_phone"
    t.boolean  "receives_text_msgs"
    t.boolean  "active"
  end

  create_table "households", force: true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "home_phone"
    t.string   "county"
    t.boolean  "active"
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
    t.string   "name"
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
    t.string   "jersey_size"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "physical_date"
    t.string   "child_promise_sign"
    t.date     "child_promise_date"
    t.string   "report_card"
    t.boolean  "parent_consent_agree"
    t.boolean  "parent_promise_agree"
    t.boolean  "parent_release_agree"
    t.string   "parent_signature"
    t.date     "parent_sign_date"
  end

  create_table "roster_spots", force: true do |t|
    t.integer  "team_id"
    t.integer  "student_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.string   "district"
    t.string   "county"
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
    t.integer  "school_id"
  end

  create_table "team_games", force: true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
  end

  create_table "teams", force: true do |t|
    t.integer  "bracket_id"
    t.string   "name"
    t.integer  "max_students"
    t.integer  "num_wins"
    t.integer  "num_losses"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournaments", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "volunteer_id"
  end

  create_table "volunteers", force: true do |t|
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "cell_phone"
    t.boolean  "receives_text_msgs"
    t.boolean  "active"
    t.string   "role"
    t.date     "date"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "day_phone"
    t.integer  "years_with_proj_chuck"
    t.string   "position"
    t.string   "team_coached"
    t.string   "child_name"
    t.string   "shirt_size"
    t.boolean  "has_school_clearance"
    t.string   "clearance_copy"
    t.text     "not_available"
    t.text     "two_skills"
    t.text     "suggestions"
    t.string   "volunteer_sign"
    t.date     "volunteer_sign_date"
  end

end
