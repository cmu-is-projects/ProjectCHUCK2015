class Student < ActiveRecord::Base

  filterrific(
    default_filter_params: { sorted_by: 'last_name' },
    available_filters: [
      :sorted_by,
      :search_query,
      :with_country_id,
      :with_created_at_gte
    ]
  )

	#Relationship Validations
	belongs_to :household
	belongs_to :school
	has_many :roster_spots
	has_many :registrations, :dependent => :destroy
  has_many :brackets, through: :registrations
  has_many :teams, through: :roster_spots

  accepts_nested_attributes_for :registrations, reject_if: lambda { |registration| registration[:has_report_card].blank? }, allow_destroy: true

  # Validations
  # -----------------------------
  # make sure required fields are present
  validates_presence_of :school_id, :first_name, :last_name, :gender, :emergency_contact_name, :emergency_contact_phone, :dob
  #validates_date :dob, :before => lambda { Date.current }, :message => "cannot be in the future", allow_blank: false, on: :create
  validates_date :dob, :before => lambda { Date.today }
  #validates_uniqueness_of :email, allow_blank: true
  validates_format_of :email, :with => /\A[\w]([^@\s,;]+)@(([a-z0-9.-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, :message => "is not a valid format", :allow_blank => true
  validates_format_of :cell_phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only", :allow_blank => true
  validates_format_of :emergency_contact_phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only", :allow_blank => false
  validates_numericality_of :grade
  GRADESWITHK_ARRAY = [["K", 0]] + (1..12).to_a
  GRADES_ARRAY = (0..12).to_a
  GENDER_ARRAY = ["M","F"]
  validates :grade, inclusion: { in: GRADES_ARRAY, allow_blank: false } 
  validates :gender, inclusion: { in: GENDER_ARRAY, allow_blank: false } 
  # validate :household_is_active_in_system

	# Scopes
  # -----------------------------
  scope :alphabetical, -> { order('last_name, first_name') }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :by_school,   -> { joins(:school).order('schools.name') }
  scope :by_district,   -> { joins(:school).order('schools.district') }
  scope :by_county,   -> { joins(:school).order('schools.county') }
  #by_district (district)?
  #by_county (county)?
  scope :missing_birthcert,  -> { where(has_birth_certificate: 'false')}
  scope :by_grade, ->(grade) { where("grade = ?", grade) }
  scope :by_gender, ->(gender) { where("gender = ?", gender) }
  scope :male, -> { where("gender = ?","M") }
  scope :female, -> { where("gender = ?", "F") }
  scope :has_allergies, -> { where('allergies IS NOT NULL')}
  scope :has_medications, -> { where('medications IS NOT NULL')}

  scope :search_query, lambda { |query|
  # Searches the students table on the 'first_name' and 'last_name' columns.
  # Matches using LIKE, automatically appends '%' to each term.
  # LIKE is case INsensitive with MySQL, however it is case
  # sensitive with PostGreSQL. To make it work in both worlds,
  # we downcase everything.
  return nil  if query.blank?

  # condition query, parse into individual keywords
  terms = query.downcase.split(/\s+/)

  # replace "*" with "%" for wildcard searches,
  # append '%', remove duplicate '%'s
  terms = terms.map { |e|
    (e.gsub('*', '%') + '%').gsub(/%+/, '%')
  }
  # configure number of OR conditions for provision
  # of interpolation arguments. Adjust this if you
  # change the number of OR conditions.
  num_or_conds = 2
  where(
    terms.map { |term|
      "(LOWER(students.first_name) LIKE ? OR LOWER(students.last_name) LIKE ?)"
    }.join(' AND '),
    *terms.map { |e| [e] * num_or_conds }.flatten
  )
  }
  scope :sorted_by, lambda { |sort_option|
  # extract the sort direction from the param value.
  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
  case sort_option.to_s
  when /^created_at_/
    # Simple sort on the created_at column.
    # Make sure to include the table name to avoid ambiguous column names.
    # Joining on other tables is quite common in Filterrific, and almost
    # every ActiveRecord table has a 'created_at' column.
    order("students.created_at #{ direction }")
  when /^name_/
    # Simple sort on the name colums
    order("LOWER(students.last_name) #{ direction }, LOWER(students.first_name) #{ direction }")
  end
}
  # scope :with_country_id, lambda { |country_ids|
  #   # # Filters students with any of the given country_ids
  #   # ...
  # }
  # scope :with_created_at_gte, lambda { |ref_date|
  #   # ...
  # }

  # Methods
  # -----------------------------
  def proper_name
    first_name + " " + last_name
  end
  
  def name
    last_name + ", " + first_name
  end

  def age
    thisyear = Time.now.year
    now = Date.new(thisyear, 6, 1)
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

   def self.options_for_sorted_by
    [
      ['Name (a-z)', 'last_name'],
      ['Male students', 'male'],
      ['Female students', 'female'],
      ['By School', 'by_school'],
      ['By Grade', 'by_grade'],
      ['Has Allergies', 'has_allergies'],
      ['Has Medications', 'has_medications']   
    ]
  end

  private
     # We need to strip non-digits before saving to db
     def reformat_cell_phone
       cell_phone = self.cell_phone.to_s  # change to string in case input as all numbers 
       cell_phone.gsub!(/[^0-9]/,"") # strip all non-digits
       self.cell_phone = cell_phone       # reset self.phone to new string
     end

     def reformat_emergency_cell_phone
       emergency_contact_phone = self.emergency_contact_phone.to_s  # change to string in case input as all numbers 
       emergency_contact_phone.gsub!(/[^0-9]/,"") # strip all non-digits
       self.emergency_contact_phone = emergency_contact_phone       # reset self.phone to new string
     end

    #household_id is valid in system
    # def household_is_active_in_system
    #   all_active_households = Household.active.to_a.map{|u| u.id}
    #   unless all_active_households.include?(self.household_id)
    #     errors.add(:household_id, "is not an active household in the system")
    #   end
    # end 
end
