class Signup < ActiveRecord::Base
  
  EXPERIENCE_LEVELS = %w(novice intermediate advanced expert)
  
  DECIDED_STATUSES = 'rejected', 'approved'
  
  has_one :home_check
  belongs_to :carer
  belongs_to :decided_by, :class_name => "User", :foreign_key => :decided_by

  acts_as_mappable
  validates_presence_of :first_name, :last_name
  wraps_attribute :email_address, EmailAddress
  validates_presence_of :address_1, :suburb
  validates_format_of :postcode, :with => /\A\d\d\d\d\Z/
  wraps_attribute :mobile_phone, PhoneNumber, :allow_blank => true
  wraps_attribute :home_phone,   PhoneNumber, :allow_blank => true
  wraps_attribute :work_phone,   PhoneNumber, :allow_blank => true
  validate :must_have_at_least_one_phone_number

  named_scope :pending, :conditions => {:status => 'pending'}

  before_validation_on_create :geocode_address

  named_scope :can_keep_dogs, lambda { |number|
    { :conditions => ["can_keep_dogs >= ?", number.to_i] }
  }

  named_scope :hours_at_home, lambda { |number|
    { :conditions => ["hours_spent_at_home_per_day >= ?", number.to_i] }
  }

  def interview
    nil
  end

  def completing_interview?
    interview_completed_changed? && interview_completed?
  end

  def self.generate_csv(carers)
     FasterCSV.generate do |csv|
       csv << CSV_FIELDS

       carers.each do |v|
         csv << (CSV_FIELDS.map{ |f| v.send(f) }).flatten
       end
     end
  end

  CSV_FIELDS = (Carer.column_names - ["id", "created_at", "updated_at", "lat", "lng"])

  def self.viewable_fields
    CSV_FIELDS
  end

  def name
    "#{first_name} #{last_name}"
  end

  def address
    "#{address_1}, #{address_2}, #{suburb}, #{postcode}, australia"
  end

  def must_have_at_least_one_phone_number
    if mobile_phone.blank? && home_phone.blank? && work_phone.blank?
      errors.add_to_base("You must provide at least one of mobile phone, home phone, or work phone")
    end
  end

  def update_latlng
    geo=Geokit::Geocoders::MultiGeocoder.geocode(address)
    # errors.add(:address, "Could not Geocode address") if !geo.success
    self.lat, self.lng = geo.lat,geo.lng if geo.success
    save
  end

  def rejected?
    status == 'rejected'
  end
  
  def approved?
    status == 'approved'
  end
  
  def pending?
    ! (approved? || rejected?)
  end

  private
  def geocode_address
    geo=Geokit::Geocoders::MultiGeocoder.geocode(address)
    # errors.add(:address, "Could not Geocode address") if !geo.success
    self.lat, self.lng = geo.lat,geo.lng if geo.success
  end
end
