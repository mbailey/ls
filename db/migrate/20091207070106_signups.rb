class Signups < ActiveRecord::Migration
  def self.up
    create_table "signups", :force => true do |t|
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
      t.string   "status",                                   :default => "pending"
      t.boolean  "interview_completed"
      t.text     "interview_notes"
      t.datetime "interview_date"
      t.integer  "interview_user_id"
      t.string   "experience_level"
    end
  end

  def self.down
    drop_table :signups
  end
end
