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

ActiveRecord::Schema.define(version: 20160122180119) do

  create_table "healthchecks", force: :cascade do |t|
    t.string   "handle",     null: false
    t.boolean  "locked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["handle"], name: "index_healthchecks_on_handle"
  end

  create_table "opinions", force: :cascade do |t|
    t.string   "handle"
    t.integer  "champion"
    t.integer  "team"
    t.integer  "alignment"
    t.integer  "keeping_score"
    t.integer  "transparency"
    t.integer  "progress"
    t.integer  "quality"
    t.integer  "scrappy"
    t.text     "comments"
    t.integer  "healthcheck_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["handle"], name: "index_opinions_on_handle"
    t.index ["healthcheck_id"], name: "index_opinions_on_healthcheck_id"
  end

end
