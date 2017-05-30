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

ActiveRecord::Schema.define(version: 20170530091952) do

  create_table "attempts", force: :cascade do |t|
    t.integer "user_id"
    t.string "assignable_type"
    t.integer "assignable_id"
    t.boolean "success"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignable_type", "assignable_id"], name: "index_attempts_on_assignable_type_and_assignable_id"
    t.index ["user_id"], name: "index_attempts_on_user_id"
  end

  create_table "course_tests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.string "assignable_type"
    t.integer "assignable_id"
    t.string "educable_type"
    t.integer "educable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignable_type", "assignable_id"], name: "index_enrollments_on_assignable_type_and_assignable_id"
    t.index ["educable_type", "educable_id"], name: "index_enrollments_on_educable_type_and_educable_id"
  end

  create_table "results", force: :cascade do |t|
    t.boolean "success"
    t.integer "user_id"
    t.integer "attempt_id"
    t.string "assignable_type"
    t.integer "assignable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignable_type", "assignable_id"], name: "index_results_on_assignable_type_and_assignable_id"
    t.index ["attempt_id"], name: "index_results_on_attempt_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "user_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "login"
    t.string "password_digest"
    t.boolean "is_admin", default: false
    t.integer "user_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login"], name: "index_users_on_login", unique: true
    t.index ["user_group_id"], name: "index_users_on_user_group_id"
  end

end
