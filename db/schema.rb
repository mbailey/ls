# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091122065637) do

  create_table "users", :force => true do |t|
    t.string   "username",          :limit => 25, :null => false
    t.string   "email",                           :null => false
    t.string   "first_name",        :limit => 50, :null => false
    t.string   "last_name",         :limit => 50, :null => false
    t.string   "crypted_password",                :null => false
    t.string   "password_salt",                   :null => false
    t.string   "persistence_token",               :null => false
    t.string   "perishable_token",                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "volunteers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "suburb"
    t.string   "postcode"
    t.string   "mobile_phone"
    t.string   "home_phone"
    t.string   "work_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "can_keep_dogs"
    t.integer  "can_keep_cats"
    t.string   "can_keep_other"
    t.boolean  "can_keep_inside_initially"
    t.boolean  "can_sleep_inside_ongoing"
    t.integer  "dogs_owned"
    t.integer  "cats_owned"
    t.string   "other_owned"
    t.integer  "hours_spent_at_home_per_day"
    t.integer  "children"
    t.string   "children_ages"
    t.boolean  "can_transport"
    t.boolean  "requires_financial_support"
    t.integer  "offer_duration"
    t.string   "email_address"
    t.boolean  "will_take_stray"
    t.string   "how_secure"
    t.integer  "dog_safe_gates",              :limit => 1
    t.string   "special_skills"
    t.boolean  "can_administer_medical_care"
    t.float    "lat"
    t.float    "lng"
    t.string   "state",                                    :default => "pending"
    t.boolean  "interview_completed"
    t.text     "interview_notes"
    t.datetime "interview_date"
    t.integer  "interview_user_id"
  end

end
