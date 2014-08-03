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

ActiveRecord::Schema.define(version: 20140730081914) do

  create_table "question_answers", force: true do |t|
    t.integer  "question_id"
    t.string   "answer",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_answers", ["question_id"], name: "index_question_answers_on_question_id", using: :btree

  create_table "question_categories", force: true do |t|
    t.string   "name"
    t.string   "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_categories", ["name"], name: "index_question_categories_on_name", unique: true, using: :btree

  create_table "questions", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.string   "questionText"
    t.string   "image"
    t.integer  "qtype",           default: 0
    t.string   "possible_values", default: "none"
    t.string   "version",         default: "1"
    t.integer  "created_by"
    t.integer  "modified_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["category_id"], name: "index_questions_on_category_id", using: :btree

  create_table "quiz_questions", force: true do |t|
    t.integer  "quiz_id"
    t.integer  "question_id"
    t.integer  "marks",       default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quiz_questions", ["question_id"], name: "index_quiz_questions_on_question_id", using: :btree
  add_index "quiz_questions", ["quiz_id"], name: "index_quiz_questions_on_quiz_id", using: :btree

  create_table "quiz_response_answers", force: true do |t|
    t.integer  "quiz_response_id"
    t.integer  "question_id"
    t.boolean  "is_correct"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quiz_response_answers", ["quiz_response_id"], name: "index_quiz_response_answers_on_quiz_response_id", using: :btree

  create_table "quiz_responses", force: true do |t|
    t.integer  "quiz_id"
    t.datetime "timestart"
    t.datetime "timefinish"
    t.integer  "submitted_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quiz_responses", ["quiz_id"], name: "index_quiz_responses_on_quiz_id", using: :btree

  create_table "quiz_users", force: true do |t|
    t.integer  "quiz_id"
    t.integer  "assigned_to"
    t.integer  "assigned_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quiz_users", ["quiz_id"], name: "index_quiz_users_on_quiz_id", using: :btree

  create_table "quizzes", force: true do |t|
    t.boolean  "shuffle",     default: false
    t.integer  "timelimit",   default: 0
    t.integer  "attempts",    default: 0
    t.integer  "created_by"
    t.integer  "modified_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "role",                 default: "student", null: false
    t.string "email",                default: "",        null: false
    t.string "encrypted_password",   default: "",        null: false
    t.string "authentication_token"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
