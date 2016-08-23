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

ActiveRecord::Schema.define(version: 20160822234923) do

  create_table "answers", force: :cascade do |t|
    t.text     "content"
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.string   "chapter"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "course_id"
    t.boolean  "is_hidden",  default: true
  end

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "price"
    t.boolean  "is_hidden",    default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "image"
    t.string   "teacher_name"
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.float    "price",               default: 0.0
    t.integer  "user_id"
    t.string   "token"
    t.string   "payment_method"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "aasm_state",          default: "unpaid"
    t.integer  "subscription_months"
    t.index ["aasm_state"], name: "index_orders_on_aasm_state"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "chapter_id"
    t.text     "article"
    t.boolean  "is_hidden",  default: true
    t.integer  "course_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.text     "content"
  end

  create_table "settings", force: :cascade do |t|
    t.string   "username"
    t.string   "nickname"
    t.string   "hobbies"
    t.string   "birthday"
    t.string   "sex"
    t.string   "selfintroduction"
    t.string   "address"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "description"
    t.datetime "due_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
    t.date     "member_expire_date"
    t.string   "username"
    t.string   "nickname"
    t.string   "hobbies"
    t.string   "gender"
    t.string   "selfintroduction"
    t.string   "address"
    t.string   "birthday"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.text     "content"
    t.integer  "assignment_id"
    t.integer  "user_id"
    t.string   "image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
