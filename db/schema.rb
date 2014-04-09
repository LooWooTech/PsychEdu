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

ActiveRecord::Schema.define(version: 20140407090722) do

  create_table "accounts", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["owner_id", "owner_type"], name: "index_accounts_on_owner_id_and_owner_type", using: :btree

  create_table "administrators", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "announcements", force: true do |t|
    t.integer  "topic_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "announcements", ["topic_id"], name: "index_announcements_on_topic_id", using: :btree

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "answerer_id"
    t.string   "answerer_type"
  end

  add_index "answers", ["answerer_id", "answerer_type"], name: "index_answers_on_answerer_id_and_answerer_type", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "case_questions", force: true do |t|
    t.text     "content"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "case_questions", ["unit_id"], name: "index_case_questions_on_unit_id", using: :btree

  create_table "chapter_learnings", force: true do |t|
    t.integer  "topic_learning_id"
    t.integer  "chapter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chapter_learnings", ["chapter_id"], name: "index_chapter_learnings_on_chapter_id", using: :btree
  add_index "chapter_learnings", ["topic_learning_id"], name: "index_chapter_learnings_on_topic_learning_id", using: :btree

  create_table "chapters", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "topic_id"
    t.integer  "position",   default: 0
  end

  add_index "chapters", ["topic_id"], name: "index_chapters_on_topic_id", using: :btree

  create_table "choices", force: true do |t|
    t.text     "content"
    t.boolean  "correct",              default: false
    t.integer  "choice_question_id"
    t.string   "choice_question_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "choices", ["choice_question_id", "choice_question_type"], name: "index_choices_on_choice_question_id_and_choice_question_type", using: :btree

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "commenter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "commenter_type"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["commenter_id", "commenter_type"], name: "index_comments_on_commenter_id_and_commenter_type", using: :btree

  create_table "complaints", force: true do |t|
    t.text     "content"
    t.integer  "complainable_id"
    t.string   "complainable_type"
    t.integer  "complainer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "complainer_type"
  end

  add_index "complaints", ["complainable_id", "complainable_type"], name: "index_complaints_on_complainable_id_and_complainable_type", using: :btree
  add_index "complaints", ["complainer_id", "complainer_type"], name: "index_complaints_on_complainer_id_and_complainer_type", using: :btree

  create_table "forums", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "learning_periods", force: true do |t|
    t.integer  "topic_learning_id"
    t.date     "start_on"
    t.date     "end_on"
    t.integer  "review_state",      default: 0
    t.integer  "reviewer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "learning_periods", ["reviewer_id"], name: "index_learning_periods_on_reviewer_id", using: :btree
  add_index "learning_periods", ["topic_learning_id"], name: "index_learning_periods_on_topic_learning_id", using: :btree

  create_table "leaving_periods", force: true do |t|
    t.integer  "learning_period_id"
    t.date     "start_on"
    t.date     "end_on"
    t.integer  "review_state",       default: 0
    t.integer  "reviewer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leaving_periods", ["learning_period_id"], name: "index_leaving_periods_on_learning_period_id", using: :btree
  add_index "leaving_periods", ["reviewer_id"], name: "index_leaving_periods_on_reviewer_id", using: :btree

  create_table "monthly_online_trackings", force: true do |t|
    t.integer  "topic_learning_id"
    t.integer  "seconds",           default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "monthly_online_trackings", ["topic_learning_id"], name: "index_monthly_online_trackings_on_topic_learning_id", using: :btree

  create_table "multiple_choice_answers", force: true do |t|
    t.integer  "multiple_choice_question_id"
    t.integer  "case_answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unit_exam_id"
  end

  add_index "multiple_choice_answers", ["case_answer_id"], name: "index_multiple_choice_answers_on_case_answer_id", using: :btree
  add_index "multiple_choice_answers", ["multiple_choice_question_id"], name: "index_multiple_choice_answers_on_multiple_choice_question_id", using: :btree
  add_index "multiple_choice_answers", ["unit_exam_id"], name: "index_multiple_choice_answers_on_unit_exam_id", using: :btree

  create_table "multiple_choice_questions", force: true do |t|
    t.text     "content"
    t.integer  "unit_id"
    t.integer  "case_question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "multiple_choice_questions", ["case_question_id"], name: "index_multiple_choice_questions_on_case_question_id", using: :btree
  add_index "multiple_choice_questions", ["unit_id"], name: "index_multiple_choice_questions_on_unit_id", using: :btree

  create_table "multiple_choices", force: true do |t|
    t.integer "choice_id"
    t.integer "multiple_choice_answer_id"
  end

  add_index "multiple_choices", ["choice_id"], name: "index_multiple_choices_on_choice_id", using: :btree

  create_table "notes", force: true do |t|
    t.integer  "video_watching_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "play_time_point",   default: 0.0
  end

  add_index "notes", ["video_watching_id"], name: "index_notes_on_video_watching_id", using: :btree

  create_table "questions", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "top",             default: false
    t.boolean  "refined",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "questioner_id"
    t.integer  "forum_id"
    t.string   "questioner_type"
  end

  add_index "questions", ["forum_id"], name: "index_questions_on_forum_id", using: :btree
  add_index "questions", ["questioner_id", "questioner_type"], name: "index_questions_on_questioner_id_and_questioner_type", using: :btree

  create_table "resumings", force: true do |t|
    t.integer  "leaving_period_id"
    t.date     "date"
    t.integer  "review_state",      default: 0
    t.integer  "reviewer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resumings", ["leaving_period_id"], name: "index_resumings_on_leaving_period_id", using: :btree
  add_index "resumings", ["reviewer_id"], name: "index_resumings_on_reviewer_id", using: :btree

  create_table "singular_choice_answers", force: true do |t|
    t.integer  "singular_choice_question_id"
    t.integer  "case_answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unit_exam_id"
    t.integer  "choice_id"
  end

  add_index "singular_choice_answers", ["case_answer_id"], name: "index_singular_choice_answers_on_case_answer_id", using: :btree
  add_index "singular_choice_answers", ["choice_id"], name: "index_singular_choice_answers_on_choice_id", using: :btree
  add_index "singular_choice_answers", ["singular_choice_question_id"], name: "index_singular_choice_answers_on_singular_choice_question_id", using: :btree
  add_index "singular_choice_answers", ["unit_exam_id"], name: "index_singular_choice_answers_on_unit_exam_id", using: :btree

  create_table "singular_choice_questions", force: true do |t|
    t.text     "content"
    t.integer  "unit_id"
    t.integer  "case_question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "singular_choice_questions", ["case_question_id"], name: "index_singular_choice_questions_on_case_question_id", using: :btree
  add_index "singular_choice_questions", ["unit_id"], name: "index_singular_choice_questions_on_unit_id", using: :btree

  create_table "students", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gender",              default: 2
    t.string   "unit_code"
    t.string   "note"
    t.integer  "added_by_id"
    t.string   "cipher"
    t.string   "cipher_answer"
    t.string   "telephone"
    t.string   "mobile"
    t.string   "email"
    t.string   "qq"
    t.string   "identification"
    t.date     "birthday"
    t.string   "province"
    t.string   "unit_name"
    t.string   "address"
    t.string   "zip_code"
    t.string   "education"
    t.string   "special_field"
    t.string   "level"
    t.string   "certificate_number"
    t.date     "certify_date"
    t.text     "training_experience"
    t.text     "psychology_job"
  end

  add_index "students", ["added_by_id"], name: "index_students_on_added_by_id", using: :btree

  create_table "topic_exam_materials", force: true do |t|
    t.integer  "topic_exam_id"
    t.string   "file"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topic_exam_materials", ["topic_exam_id"], name: "index_topic_exam_materials_on_topic_exam_id", using: :btree

  create_table "topic_exams", force: true do |t|
    t.integer  "topic_learning_id"
    t.text     "review"
    t.boolean  "submitted",         default: false
    t.integer  "score",             default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topic_exams", ["topic_learning_id"], name: "index_topic_exams_on_topic_learning_id", using: :btree

  create_table "topic_learnings", force: true do |t|
    t.integer  "student_id"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "current",    default: false
  end

  add_index "topic_learnings", ["student_id"], name: "index_topic_learnings_on_student_id", using: :btree
  add_index "topic_learnings", ["topic_id"], name: "index_topic_learnings_on_topic_id", using: :btree

  create_table "topic_testings", force: true do |t|
    t.integer  "topic_id"
    t.string   "title"
    t.text     "content"
    t.text     "requirements"
    t.text     "grading_rules"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topic_testings", ["topic_id"], name: "index_topic_testings_on_topic_id", using: :btree

  create_table "topics", force: true do |t|
    t.string   "name"
    t.string   "teacher_names"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "introduction"
    t.string   "guide_video_url"
    t.string   "review_video_url"
  end

  create_table "unit_exams", force: true do |t|
    t.integer  "unit_learning_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "submitted",        default: false
  end

  add_index "unit_exams", ["unit_learning_id"], name: "index_unit_exams_on_unit_learning_id", using: :btree

  create_table "unit_learnings", force: true do |t|
    t.integer  "chapter_learning_id"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "unit_learnings", ["chapter_learning_id"], name: "index_unit_learnings_on_chapter_learning_id", using: :btree
  add_index "unit_learnings", ["unit_id"], name: "index_unit_learnings_on_unit_id", using: :btree

  create_table "units", force: true do |t|
    t.string   "name"
    t.integer  "chapter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",              default: 0
    t.integer  "singular_choice_count", default: 0
    t.integer  "multiple_choice_count", default: 0
    t.integer  "case_count",            default: 0
    t.integer  "exam_minutes",          default: 0
    t.text     "summary"
    t.text     "review"
  end

  add_index "units", ["chapter_id"], name: "index_units_on_chapter_id", using: :btree

  create_table "video_watchings", force: true do |t|
    t.integer  "unit_learning_id"
    t.integer  "video_id"
    t.float    "last_end_at",      default: 0.0
    t.integer  "play_times",       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "seconds",          default: 0.0
    t.text     "playing_data"
    t.boolean  "with_comment",     default: true
  end

  add_index "video_watchings", ["unit_learning_id"], name: "index_video_watchings_on_unit_learning_id", using: :btree
  add_index "video_watchings", ["video_id"], name: "index_video_watchings_on_video_id", using: :btree

  create_table "videos", force: true do |t|
    t.string   "url"
    t.string   "teacher_names"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "duration",      default: 0
    t.string   "name"
  end

  add_index "videos", ["unit_id"], name: "index_videos_on_unit_id", using: :btree

end
