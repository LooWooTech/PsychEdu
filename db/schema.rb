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

ActiveRecord::Schema.define(version: 20131104034120) do

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "answerer_id"
  end

  add_index "answers", ["answerer_id"], name: "index_answers_on_answerer_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "commenter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["commenter_id"], name: "index_comments_on_commenter_id", using: :btree

  create_table "complaints", force: true do |t|
    t.text     "content"
    t.integer  "complainable_id"
    t.string   "complainable_type"
    t.integer  "complainer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "complaints", ["complainable_id"], name: "index_complaints_on_complainable_id", using: :btree
  add_index "complaints", ["complainer_id"], name: "index_complaints_on_complainer_id", using: :btree

  create_table "forums", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "top",           default: false
    t.boolean  "refined",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "questioner_id"
    t.integer  "forum_id"
  end

  add_index "questions", ["forum_id"], name: "index_questions_on_forum_id", using: :btree
  add_index "questions", ["questioner_id"], name: "index_questions_on_questioner_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
