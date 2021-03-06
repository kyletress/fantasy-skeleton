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

ActiveRecord::Schema.define(version: 20180522221349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "athletes", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "adp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "draft_picks", id: :serial, force: :cascade do |t|
    t.integer "draft_id"
    t.integer "athlete_id"
    t.integer "team_id"
    t.integer "round"
    t.integer "pick"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_draft_picks_on_athlete_id"
    t.index ["draft_id"], name: "index_draft_picks_on_draft_id"
    t.index ["team_id"], name: "index_draft_picks_on_team_id"
  end

  create_table "drafts", id: :serial, force: :cascade do |t|
    t.integer "league_id"
    t.datetime "starts_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "round", default: 1
    t.integer "pick", default: 1
    t.integer "status", default: 0
    t.index ["league_id"], name: "index_drafts_on_league_id"
  end

  create_table "leagues", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", id: :serial, force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "teams", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pick"
    t.string "avatar"
    t.index ["league_id"], name: "index_teams_on_league_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "draft_picks", "athletes"
  add_foreign_key "draft_picks", "drafts"
  add_foreign_key "draft_picks", "teams"
  add_foreign_key "drafts", "leagues"
  add_foreign_key "teams", "leagues"
  add_foreign_key "teams", "users"
end
