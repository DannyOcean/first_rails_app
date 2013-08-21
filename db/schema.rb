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

ActiveRecord::Schema.define(version: 20130821195451) do

  create_table "projects", force: true do |t|
    t.string  "name"
    t.integer "user_id"
  end

  add_index "projects", ["name"], name: "index_projects_on_name"

  create_table "tasks", force: true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.boolean  "status",     default: false
    t.integer  "priority",   default: 1
    t.datetime "deadline"
  end

  add_index "tasks", ["deadline"], name: "index_tasks_on_deadline"
  add_index "tasks", ["name"], name: "index_tasks_on_name"
  add_index "tasks", ["priority"], name: "index_tasks_on_priority"
  add_index "tasks", ["status"], name: "index_tasks_on_status"

  create_table "users", force: true do |t|
    t.string  "login"
    t.string  "name"
    t.string  "email"
    t.string  "password"
    t.string  "password_confirmation"
    t.string  "password_digest"
    t.string  "remember_token"
    t.boolean "admin",                 default: false
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["login"], name: "index_users_on_login"
  add_index "users", ["name"], name: "index_users_on_name"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
