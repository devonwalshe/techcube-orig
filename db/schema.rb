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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130127224807) do

  create_table "contacts", :force => true do |t|
    t.string   "email"
    t.string   "iama"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "enquiries", :force => true do |t|
    t.string   "email"
    t.text     "employees"
    t.string   "company"
    t.string   "name"
    t.string   "phone"
    t.text     "pitch"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.datetime "movein_date"
  end

  create_table "events", :force => true do |t|
    t.string   "event_title"
    t.text     "event_summary"
    t.text     "event_description"
    t.string   "location"
    t.string   "postcode"
    t.string   "organiser_name"
    t.string   "organiser_email"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "approved"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "jobs", :force => true do |t|
    t.string   "company_name"
    t.string   "job_title"
    t.string   "location"
    t.string   "postcode"
    t.string   "salary"
    t.text     "job_description"
    t.text     "person_description"
    t.text     "company_description"
    t.text     "how_to"
    t.string   "user_name"
    t.string   "user_email"
    t.boolean  "approved"
    t.datetime "start_date"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

end
