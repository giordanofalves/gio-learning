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

ActiveRecord::Schema[7.1].define(version: 2024_05_27_171927) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_logs", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.integer "user_id", default: 1
    t.integer "state", default: 0
    t.integer "kind", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_logs_on_course_id"
  end

  create_table "course_logs_videos", force: :cascade do |t|
    t.bigint "course_log_id", null: false
    t.integer "time_elapsed_in_seconds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_log_id"], name: "index_course_logs_videos_on_course_log_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "thumbnail_url"
    t.string "video_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "course_logs", "courses"
  add_foreign_key "course_logs_videos", "course_logs"
end
