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

ActiveRecord::Schema.define(:version => 20121202153956) do

  create_table "reservations", :force => true do |t|
    t.date     "date"
    t.time     "time"
    t.integer  "restaurant_id"
    t.integer  "suggestor_id"
    t.integer  "acceptor_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "restaurants", :force => true do |t|
    t.text     "name"
    t.text     "city"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "cuisine"
    t.text     "description"
    t.text     "locu_id"
  end

  create_table "users", :force => true do |t|
    t.text     "name"
    t.integer  "age"
    t.text     "gender"
    t.text     "city"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "gender_target"
    t.text     "description"
  end

end
