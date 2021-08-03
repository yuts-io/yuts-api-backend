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

ActiveRecord::Schema.define(version: 2021_08_03_145333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer "student_id"
    t.text "content"
    t.integer "course_id"
    t.integer "vote_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "all_course_codes"
    t.string "areas"
    t.float "average_gut_rating"
    t.float "average_professor"
    t.float "average_rating"
    t.float "average_workload"
    t.float "average_rating_same_professors"
    t.float "average_workload_same_professors"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "classnotes"
    t.string "course_code"
    t.float "credits"
    t.integer "crn"
    t.text "description"
    t.integer "enrolled"
    t.string "extra_info"
    t.string "final_exam"
    t.string "flag_info"
    t.boolean "fysem"
    t.integer "last_enrollment"
    t.boolean "last_enrollment_same_professors"
    t.integer "listing_id"
    t.string "locations_summary"
    t.string "number"
    t.string "professor_names"
    t.text "regnotes"
    t.text "requirements"
    t.text "rp_attr"
    t.string "school"
    t.integer "season_code"
    t.integer "section"
    t.string "skills"
    t.string "subject"
    t.string "syllabus_url"
    t.string "times_summary"
    t.string "title"
    t.float "gut_index"
    t.integer "gut_percentile"
    t.integer "professor_percentile"
    t.integer "workload_percentile"
    t.integer "same_professor_total_rating_percentile"
    t.integer "same_professor_workload_percentile"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "course_id"
    t.integer "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "major"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_ratings", force: :cascade do |t|
    t.integer "course_id"
    t.integer "student_id"
    t.integer "difficulty_rating"
    t.string "grade"
    t.boolean "is_a_gut"
    t.boolean "enjoyed_class"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer "comment_id"
    t.integer "student_id"
    t.boolean "upvote"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
