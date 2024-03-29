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

ActiveRecord::Schema.define(version: 20180808092239) do

  create_table "feedback_notes", force: :cascade do |t|
    t.integer "member_id"
    t.integer "meeting_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_feedback_notes_on_meeting_id"
    t.index ["member_id"], name: "index_feedback_notes_on_member_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.date "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status"
  end

  create_table "member_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "members" because of following StandardError
#   Unknown type 'password' for column 'password'

  create_table "role_players", force: :cascade do |t|
    t.integer "meeting_id"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_id"
    t.index ["meeting_id"], name: "index_role_players_on_meeting_id"
    t.index ["member_id"], name: "index_role_players_on_member_id"
    t.index ["role_id"], name: "index_role_players_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vote_results", force: :cascade do |t|
    t.integer "member_id"
    t.integer "meeting_id"
    t.integer "role_id"
    t.integer "speaker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "note"
    t.integer "vote", default: 0
    t.index ["meeting_id"], name: "index_vote_results_on_meeting_id"
    t.index ["member_id"], name: "index_vote_results_on_member_id"
    t.index ["role_id"], name: "index_vote_results_on_role_id"
    t.index ["speaker_id"], name: "index_vote_results_on_speaker_id"
  end

end
