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

ActiveRecord::Schema.define(version: 2019_05_07_164329) do

  create_table "leccomments", force: :cascade do |t|
    t.text "whyeasylec"
    t.string "whyeasylec_tag"
    t.text "comments_for_lec"
    t.string "materials"
    t.text "homework_contents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lectures", force: :cascade do |t|
    t.string "name"
    t.integer "professor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "department"
    t.string "genre"
    t.string "langage"
    t.integer "attendance"
    t.integer "lasttest"
    t.integer "midtest"
    t.integer "report"
    t.integer "inlesson"
    t.integer "outlesson"
    t.text "other"
    t.string "teacher"
  end

  create_table "levels", force: :cascade do |t|
    t.integer "tags_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "tagname1"
    t.boolean "tagname2"
    t.boolean "tagname3"
    t.boolean "tagname4"
    t.boolean "tagname5"
    t.boolean "tagname6"
    t.boolean "tagname7"
    t.boolean "tagname8"
    t.integer "ratedoctor_id"
  end

  create_table "professors", force: :cascade do |t|
    t.string "name"
    t.string "department"
    t.text "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_satisfaction"
    t.integer "difficulty"
    t.integer "interest"
    t.integer "how_boring"
  end

  create_table "ratedoctor_levels", force: :cascade do |t|
    t.integer "ratedoctor_id"
    t.integer "level_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_ratedoctor_levels_on_level_id"
    t.index ["ratedoctor_id"], name: "index_ratedoctor_levels_on_ratedoctor_id"
  end

  create_table "ratedoctors", force: :cascade do |t|
    t.integer "total_satisfaction", default: 0
    t.integer "interest", default: 0
    t.integer "difficulty", default: 0
    t.integer "how_boring", default: 0
    t.boolean "again"
    t.text "comments_for_prof"
    t.integer "professor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "tagname1"
    t.boolean "tagname2"
    t.boolean "tagname3"
    t.boolean "tagname4"
    t.boolean "tagname5"
    t.boolean "tagname6"
    t.boolean "tagname7"
    t.boolean "tagname8"
  end

  create_table "ratelecs", force: :cascade do |t|
    t.integer "total_satisfaction"
    t.integer "interest"
    t.integer "difficulty"
    t.integer "how_boring"
    t.boolean "again"
    t.integer "lecture_id"
    t.integer "attendance_level"
    t.boolean "check_attendance"
    t.boolean "attendance_for_friends"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratelessons", force: :cascade do |t|
    t.integer "total_satisfaction"
    t.integer "interest"
    t.integer "diffficulty"
    t.integer "how_boring"
    t.boolean "failaclass"
    t.string "attendancelevel"
    t.boolean "daihen"
    t.integer "testlevel"
    t.string "prepare"
    t.boolean "pasttest"
    t.boolean "again"
    t.text "commentlec"
    t.integer "lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tagsearches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
