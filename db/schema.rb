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

ActiveRecord::Schema.define(version: 20180505144424) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "attempts", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "quiz_id",     limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.datetime "startedat"
    t.integer  "question_id", limit: 4
    t.boolean  "result"
    t.integer  "answer_id",   limit: 4
  end

  add_index "attempts", ["answer_id"], name: "index_attempts_on_answer_id", using: :btree
  add_index "attempts", ["question_id"], name: "index_attempts_on_question_id", using: :btree
  add_index "attempts", ["quiz_id"], name: "index_attempts_on_quiz_id", using: :btree
  add_index "attempts", ["user_id"], name: "index_attempts_on_user_id", using: :btree

  create_table "awards", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "source_id",   limit: 4
    t.string   "source_type", limit: 255
  end

  add_index "awards", ["source_type", "source_id"], name: "index_awards_on_source_type_and_source_id", using: :btree

  create_table "badges", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "subject_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "ancestry",   limit: 255
  end

  add_index "badges", ["ancestry"], name: "index_badges_on_ancestry", using: :btree

  create_table "bonuses", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "quiz_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "bonuses", ["quiz_id"], name: "index_bonuses_on_quiz_id", using: :btree
  add_index "bonuses", ["user_id"], name: "index_bonuses_on_user_id", using: :btree

  create_table "prerequisites", force: :cascade do |t|
    t.integer  "badge_id",   limit: 4
    t.integer  "quiz_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "question_answers", force: :cascade do |t|
    t.integer  "question_id", limit: 4
    t.integer  "answer_id",   limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "question_answers", ["answer_id"], name: "index_question_answers_on_answer_id", using: :btree
  add_index "question_answers", ["question_id"], name: "index_question_answers_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "answer_id",  limit: 4
    t.integer  "points",     limit: 4,   default: 0
    t.string   "imageurl",   limit: 255
  end

  add_index "questions", ["answer_id"], name: "index_questions_on_answer_id", using: :btree

  create_table "quiz_questions", force: :cascade do |t|
    t.integer  "quiz_id",     limit: 4
    t.integer  "question_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "quiz_questions", ["question_id"], name: "index_quiz_questions_on_question_id", using: :btree
  add_index "quiz_questions", ["quiz_id"], name: "index_quiz_questions_on_quiz_id", using: :btree

  create_table "quizzes", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "description", limit: 255
    t.string   "iconname",    limit: 255
    t.integer  "subject_id",  limit: 4
    t.integer  "points",      limit: 4,   default: 0
    t.boolean  "enabled"
    t.integer  "sample",      limit: 4,   default: 10, null: false
    t.string   "ancestry",    limit: 255
    t.integer  "minimum",     limit: 4
  end

  add_index "quizzes", ["ancestry"], name: "index_quizzes_on_ancestry", using: :btree
  add_index "quizzes", ["subject_id"], name: "index_quizzes_on_subject_id", using: :btree

  create_table "redemptions", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "reward_id",  limit: 4
    t.integer  "cost",       limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "redemptions", ["reward_id"], name: "index_redemptions_on_reward_id", using: :btree
  add_index "redemptions", ["user_id"], name: "index_redemptions_on_user_id", using: :btree

  create_table "requirements", force: :cascade do |t|
    t.integer  "badge_id",   limit: 4
    t.integer  "quiz_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "rewards", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.integer  "cost",        limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "event",       limit: 255
    t.boolean  "enabled",                 default: true
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "description", limit: 255
  end

  create_table "user_quizzes", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "quiz_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_quizzes", ["quiz_id"], name: "index_user_quizzes_on_quiz_id", using: :btree
  add_index "user_quizzes", ["user_id"], name: "index_user_quizzes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.boolean  "admin",                       default: false
    t.string   "password_digest", limit: 255
    t.string   "remember_digest", limit: 255
    t.string   "access_token",    limit: 255
    t.string   "reset_digest",    limit: 255
    t.datetime "reset_sent_at"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.datetime "lastlogin"
    t.integer  "utcoffset",       limit: 4
    t.integer  "hearts",          limit: 4,   default: 0
    t.string   "account",         limit: 255
  end

  add_index "users", ["access_token"], name: "index_users_on_access_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  add_foreign_key "attempts", "answers"
  add_foreign_key "attempts", "questions"
  add_foreign_key "attempts", "quizzes"
  add_foreign_key "attempts", "users"
  add_foreign_key "bonuses", "quizzes"
  add_foreign_key "bonuses", "users"
  add_foreign_key "question_answers", "answers"
  add_foreign_key "question_answers", "questions"
  add_foreign_key "questions", "answers"
  add_foreign_key "quiz_questions", "questions"
  add_foreign_key "quiz_questions", "quizzes"
  add_foreign_key "quizzes", "subjects"
  add_foreign_key "redemptions", "rewards"
  add_foreign_key "redemptions", "users"
  add_foreign_key "user_quizzes", "quizzes"
  add_foreign_key "user_quizzes", "users"
end
