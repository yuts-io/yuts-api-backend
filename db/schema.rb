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

ActiveRecord::Schema.define(version: 20210803033851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "all_course_codes"
    t.string   "areas"
    t.float    "average_gut_rating"
    t.float    "average_professor"
    t.float    "average_rating"
    t.float    "average_workload"
    t.float    "average_rating_same_professors"
    t.float    "average_workload_same_professors"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.text     "classnotes"
    t.string   "course_code"
    t.float    "credits"
    t.integer  "crn"
    t.text     "description"
    t.integer  "enrolled"
    t.string   "extra_info"
    t.string   "final_exam"
    t.string   "flag_info"
    t.boolean  "fysem"
    t.integer  "last_enrollment"
    t.boolean  "last_enrollment_same_professors"
    t.integer  "listing_id"
    t.string   "locations_summary"
    t.string   "number"
    t.string   "professor_names"
    t.text     "regnotes"
    t.text     "requirements"
    t.text     "rp_attr"
    t.string   "school"
    t.integer  "season_code"
    t.integer  "section"
    t.string   "skills"
    t.string   "subject"
    t.string   "syllabus_url"
    t.string   "times_summary"
    t.string   "title"
    t.float    "gut_index"
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "major"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
